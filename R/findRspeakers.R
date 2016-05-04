options(stringsAsFactors = FALSE)

get_cran_database <- function(){
  contrib.url(getOption("repos")["CRAN"], "source") # trigger chooseCRANmirror() if required
  description <- sprintf("%s/web/packages/packages.rds",
                         getOption("repos")["CRAN"])
  con <- url(description, "rb")
  on.exit(close(con))
  db <- readRDS(gzcon(con))
  rownames(db) <- NULL
  
  db = as.data.frame(db)
  return(db)
}

findRspeakers <- function(emailPattern){
  db = get_cran_database()
  rowsWithMatchingAuthors = union(grep(emailPattern, db$Author), grep(emailPattern, db$Maintainer))
  
  #grab only rows of interest and reorder columns
  possibleSpeakers = db[rowsWithMatchingAuthors,c("Package", 
                                               "Title", 
                                               "Author", 
                                               "Maintainer", 
                                               "Description",
                                               "Version", 
                                               "URL",
                                               "Published")]
  
  #remove new line characters to help with formatting
  possibleSpeakers = as.data.frame(apply(possibleSpeakers, 2, function(x) {gsub("\n", " ", x)}))  
  return(possibleSpeakers)
}

