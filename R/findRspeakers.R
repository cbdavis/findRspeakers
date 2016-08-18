options(stringsAsFactors = FALSE)

#' @import dplyr
#' @export
findRspeakers <- function(domainPattern = "", max_distance_km = 100, lat=NA, lon=NA, data_file = "geoLocatedDomains.csv"){
  
  colsToReturn = c("Package", "Title", "Author", "Maintainer", "Description", "Version", "URL", "Published", "Distance")
  
  # get the latest metadata from CRAN
  cran_db = get_cran_database()
  
  matchingPackages = NULL
  
  if (!is.na(lat) & !is.na(lon)){
    
    packagesDomainsAndDistances = get_packages_by_distance(cran_db, data_file, lat, lon)
    
    if (domainPattern != ""){
      # find nearby packages by minimum distance to the author/maintainer e-mail domains
      # also filter by domain pattern
      matchingPackages = packagesDomainsAndDistances %>% 
        filter(Distance <= max_distance_km, 
               grepl(domainPattern, Domain)) %>% 
        group_by(Package) %>% 
        slice(which.min(Distance)) %>% 
        ungroup() %>% 
        inner_join(cran_db) %>%
        arrange(Distance)
    } else {
      # find nearby packages by minimum distance to the author/maintainer e-mail domains
      matchingPackages = packagesDomainsAndDistances %>% 
        filter(Distance <= max_distance_km) %>% 
        group_by(Package) %>% 
        slice(which.min(Distance)) %>% 
        ungroup() %>% 
        inner_join(cran_db) %>%
        arrange(Distance)
    }
  } else if (domainPattern != ""){
    allPackagesAndDomains = get_domains_per_package(cran_db)
    matchingPackages = allPackagesAndDomains %>% 
      filter(grepl(domainPattern, Domain)) %>% 
      inner_join(cran_db)
  } else {
    warning("No search parameters specified (domain pattern and/or coordinates).  No results will be returned.")
  }
  
  if (is.null(matchingPackages)){
    warning("No matching packages found")
  } else {
    # We want the Distance column, but only if it exists
    existingColsToReturn = intersect(colnames(matchingPackages), colsToReturn)
    matchingPackages = matchingPackages[,existingColsToReturn]
    
    #remove new line characters to help with formatting
    matchingPackages = apply(matchingPackages, 2, function(x) {gsub("\n", " ", x)})
    row.names(matchingPackages) = NULL
  }
  return(matchingPackages)
}

get_cran_database <- function(){
  url = "http://cran.r-project.org/web/packages/packages.rds"
  filename = "packages.rds"
  
  # don't redownload if we have an existing copy of the database that is less than a day old
  downloadPackageData = TRUE
  if (file.exists(filename)){
    info <- file.info(filename)
    if (as.numeric(Sys.time() - info$mtime) < 24){
      downloadPackageData = FALSE
      print("Using existing packages.rds file that is < 24 hours old")
    }
  }
  
  if (downloadPackageData){
    download.file(url, filename)  
  }
  
  db <- readRDS(filename)
  rownames(db) <- NULL
  db = as.data.frame(db)
  # deduplicate columns - main issue seen is that there are two MD5sum columns
  db = db[,!duplicated(colnames(db))]
  return(db)
}


#' @import geosphere
get_packages_by_distance <- function(cran_db, data_file, lat, lon){
  # update our information about where e-mail domains are geolocated
  geoInfo = geolocate_domains(cran_db, data_file)
  
  # grab the returned data frames
  geoDomains = geoInfo$geoLocatedDomains
  packagesAndDomains = geoInfo$allPackagesAndDomains
  
  # remove domains for which no coordinates were found
  geoDomains = geoDomains[which(!is.na(geoDomains$latitude)),]
  
  # calculate the distances from our specified location
  geoDomains$Distance = (distCosine(c(lon, lat), cbind(geoDomains$longitude, geoDomains$latitude)))/1000  
  
  # merge together the data frames on packages, domains, and where those domains are located
  packagesDomainsAndDistances = merge(packagesAndDomains, geoDomains, by.x="Domain", by.y="DomainQueried")
  
  return(packagesDomainsAndDistances)  
}

#' @import rgeolocate
geolocate_domains <- function(cran_db, data_file = "geoLocatedDomains.csv"){
  allPackagesAndDomains = get_domains_per_package(cran_db)
  
  allDomains = unique(allPackagesAndDomains$Domain)
  
  if (file.exists(data_file)){
    geoLocatedDomains = read.csv(data_file)
    missingDataDomains = setdiff(allDomains, geoLocatedDomains$DomainQueried)
  } else {
    missingDataDomains = allDomains
  }
  
  missingDataDomains = missingDataDomains[which(missingDataDomains != "")]
  
  tmp_geoLocatedDomains = NULL
  if (length(missingDataDomains) > 0){
    # This takes about 20 minutes for ~8000 CRAN packages with 2000 domains
    start.time <- Sys.time()
    tmp_geoLocatedDomains = ip_api(missingDataDomains, delay=TRUE)
    end.time <- Sys.time()
    print(paste("geolocating", length(missingDataDomains), "domains in", end.time - start.time, "minutes"))
    tmp_geoLocatedDomains$DomainQueried = missingDataDomains
  }
  
  if (file.exists(data_file)){
    if (!is.null(tmp_geoLocatedDomains)){
      geoLocatedDomains = rbind(geoLocatedDomains, tmp_geoLocatedDomains)  
    } # else we have no updates, geoLocatedDomains as read from file is already up to date
    
  } else { # no data file yet, use all the results we have just gathered
    geoLocatedDomains = tmp_geoLocatedDomains
  }
  
  geoLocatedDomains$latitude = as.numeric(geoLocatedDomains$latitude)
  geoLocatedDomains$longitude = as.numeric(geoLocatedDomains$longitude)
  
  geoLocatedDomains = geoLocatedDomains[which(geoLocatedDomains$DomainQueried != ""),]
  
  write.table(geoLocatedDomains, data_file, sep=",", row.names = FALSE)
  
  return(list(geoLocatedDomains = geoLocatedDomains,
              allPackagesAndDomains = allPackagesAndDomains))
}

get_domains_per_package <- function(cran_db){
  allPackagesAndDomains = c()
  
  # these domains that don't give us much geo info
  domainsToIgnore = c("bitbucket.org", "r-project.org", "github.com", "github.org", "sourceforge.net", "code.google.com")
  
  domainsToIgnoreRegEx = paste0(gsub("\\.", "\\\\.", domainsToIgnore), collapse="|")
  
  # clean up the URLs so that they're easier to work with  
  cran_db$URL = gsub("Mailing list:", "", cran_db$URL)
  cran_db$URL = gsub("\n", "", cran_db$URL)
  cran_db$URL = gsub(", +", ",", cran_db$URL)
  # take out https and http bits
  cran_db$URL = gsub("http[s]*://", "", cran_db$URL)
  cran_db$URL = tolower(cran_db$URL)
  
  for (packageIndex in c(1:nrow(cran_db))){
    
    package = cran_db$Package[packageIndex]
    
    #### get package url date
    urls = strsplit(cran_db$URL[packageIndex], ",")[[1]]
    for (url in urls){
      domain = strsplit(url, "/")[[1]][1]
      
      # if we don't get a match, then it's ok to add
      # this ignores domains like github which don't give us any useful geo information
      if (grepl(domainsToIgnoreRegEx, domain) == FALSE)
        if (!is.na(domain)){
          allPackagesAndDomains = rbind(allPackagesAndDomains, c(package, domain))    
        }
    }
    
    ##### get maintainer data
    maintainer = cran_db$Maintainer[packageIndex]
    domain = gsub(">", "", strsplit(maintainer, "@")[[1]][2])
    if (!is.na(domain)){
      allPackagesAndDomains = rbind(allPackagesAndDomains, c(package, domain))  
    }
    
    ##### get author data
    authors = cran_db$`Authors@R`[packageIndex]
    people = eval(parse(text=authors))
    if (class(people) == "character"){
      people = as.person(people)
    }
    for (person in people){
      if (class(person) == "person"){
        if (!is.null(person$email)){
          domain = strsplit(person$email, "@")[[1]][2]
          if (!is.na(domain)){
            # keep track of which domains occur with which packages
            allPackagesAndDomains = rbind(allPackagesAndDomains, c(package, domain))
          }
        }
      }
    }
  }  
  
  allPackagesAndDomains = allPackagesAndDomains[!duplicated(allPackagesAndDomains),]
  allPackagesAndDomains = as.data.frame(allPackagesAndDomains)
  colnames(allPackagesAndDomains) = c("Package", "Domain")
  
  # at least one domain has quotes added to it
  allPackagesAndDomains$Domain = gsub('"', '', allPackagesAndDomains$Domain)
  
  return(allPackagesAndDomains)
}