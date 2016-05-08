options(stringsAsFactors = FALSE)

get_cran_database <- function(){
  description = "http://cran.r-project.org/web/packages/packages.rds"
  con <- url(description, "rb")
  on.exit(close(con))
  db <- readRDS(gzcon(con))
  rownames(db) <- NULL
  db = as.data.frame(db)
  # deduplicate columns - main issue seen is that there are two MD5sum columns
  db = db[,!duplicated(colnames(db))]
  return(db)
}

#' @import dplyr
#' @export
findRspeakers <- function(emailPattern = "", max_distance_km = 100, lat=NA, lon=NA, data_file = "geoLocatedEMailDomains.csv"){
  
  colsToReturn = c("Package", "Title", "Author", "Maintainer", "Description", "Version", "URL", "Published", "Distance")
  
  # get the latest metadata from CRAN
  cran_db = get_cran_database()
  
  matchingPackages = NULL
  
  if (!is.na(lat) & !is.na(lon)){
    
    packagesDomainsAndDistances = get_packages_by_distance(cran_db, data_file, lat, lon)
    
    if (emailPattern != ""){
      # find nearby packages by minimum distance to the author/maintainer e-mail domains
      # also filter by domain pattern
      matchingPackages = packagesDomainsAndDistances %>% 
        filter(Distance <= max_distance_km, 
               grepl(emailPattern, Domain)) %>% 
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
  } else if (emailPattern != ""){
    allPackagesAndEmailDomains = get_email_domains_per_package(cran_db)
    matchingPackages = allPackagesAndEmailDomains %>% 
      filter(grepl(emailPattern, Domain)) %>% 
      inner_join(cran_db)
  } else {
    warning("No search parameters specified (e-mail domain pattern and/or coordinates).  No results will be returned.")
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

#' @import geosphere
get_packages_by_distance <- function(cran_db, data_file, lat, lon){
  # update our information about where e-mail domains are geolocated
  geoInfo = geolocate_email_addresses(cran_db, data_file)
  
  # grab the returned data frames
  geoDomains = geoInfo$geoLocatedEMailDomains
  packagesAndDomains = geoInfo$allPackagesAndEmailDomains
  
  # remove domains for which no coordinates were found
  geoDomains = geoDomains[which(!is.na(geoDomains$latitude)),]
  
  # calculate the distances from our specified location
  geoDomains$Distance = (distCosine(c(lon, lat), cbind(geoDomains$longitude, geoDomains$latitude)))/1000  
  
  # merge together the data frames on packages, domains, and where those domains are located
  packagesDomainsAndDistances = merge(packagesAndDomains, geoDomains, by.x="Domain", by.y="DomainQueried")
  
  return(packagesDomainsAndDistances)  
}

#' @import rgeolocate
geolocate_email_addresses <- function(cran_db, data_file = "geoLocatedEMailDomains.csv"){
  allPackagesAndEmailDomains = get_email_domains_per_package(cran_db)
  
  allDomains = unique(allPackagesAndEmailDomains$Domain)
  
  if (file.exists(data_file)){
    geoLocatedEMailDomains = read.csv(data_file)
    missingDataDomains = setdiff(allDomains, geoLocatedEMailDomains$DomainQueried)
  } else {
    missingDataDomains = allDomains
  }
  
  missingDataDomains = missingDataDomains[which(missingDataDomains != "")]
  
  tmp_geoLocatedEMailDomains = NULL
  if (length(missingDataDomains) > 0){
    # This takes about 20 minutes for ~8000 CRAN packages with 2000 domains
    start.time <- Sys.time()
    tmp_geoLocatedEMailDomains = ip_api(missingDataDomains, delay=TRUE)
    end.time <- Sys.time()
    print(paste("geolocating", length(missingDataDomains), "domains in", end.time - start.time, "minutes"))
    tmp_geoLocatedEMailDomains$DomainQueried = missingDataDomains
  }
  
  if (file.exists(data_file)){
    if (!is.null(tmp_geoLocatedEMailDomains)){
      geoLocatedEMailDomains = rbind(geoLocatedEMailDomains, tmp_geoLocatedEMailDomains)  
    } # else we have no updates, geoLocatedEMailDomains as read from file is already up to date
    
  } else { # no data file yet, use all the results we have just gathered
    geoLocatedEMailDomains = tmp_geoLocatedEMailDomains
  }
  
  geoLocatedEMailDomains$latitude = as.numeric(geoLocatedEMailDomains$latitude)
  geoLocatedEMailDomains$longitude = as.numeric(geoLocatedEMailDomains$longitude)
  
  geoLocatedEMailDomains = geoLocatedEMailDomains[which(geoLocatedEMailDomains$DomainQueried != ""),]
  
  write.table(geoLocatedEMailDomains, data_file, sep=",", row.names = FALSE)
  
  return(list(geoLocatedEMailDomains = geoLocatedEMailDomains,
              allPackagesAndEmailDomains = allPackagesAndEmailDomains))
}

get_email_domains_per_package <- function(cran_db){
  allPackagesAndEmailDomains = c()
  
  # extract all the e-mail domains
  allEmails = c()
  packageIndex = 0
  
  for (maintainer in cran_db$Maintainer){
    packageIndex = packageIndex + 1
    package = cran_db$Package[packageIndex]
    domain = gsub(">", "", strsplit(maintainer, "@")[[1]][2])
    if (!is.na(domain)){
      allPackagesAndEmailDomains = rbind(allPackagesAndEmailDomains, c(package, domain))  
    }
  }
  
  packageIndex = 0
  for (authors in cran_db$`Authors@R`){
    packageIndex = packageIndex + 1
    package = cran_db$Package[packageIndex]
    people = eval(parse(text=authors))
    if (class(people) == "character"){
      people = as.person(people)
    }
    for (person in people){
      if (class(person) == "list"){
        if (!is.null(person$email)){
          domain = strsplit(person$email, "@")[[1]][2]
          if (!is.na(domain)){
            # keep track of which domains occur with which packages
            allPackagesAndEmailDomains = rbind(allPackagesAndEmailDomains, c(package, domain))
          }
        }
      }
    }
  }
  
  allPackagesAndEmailDomains = allPackagesAndEmailDomains[!duplicated(allPackagesAndEmailDomains),]
  allPackagesAndEmailDomains = as.data.frame(allPackagesAndEmailDomains)
  colnames(allPackagesAndEmailDomains) = c("Package", "Domain")
  
  return(allPackagesAndEmailDomains)
}