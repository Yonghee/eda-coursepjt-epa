loadNei <- function() {
    message("initialize NEI data set....")
    NEI <- readRDS("./data/summarySCC_PM25.rds")
    yearV <- c("1999","2002","2005","2008")
    
    resultData <- subset(NEI, subset=(NEI$year %in% yearV))
    
    #resultData$year <- factor(resultData$year,labels=yearV)
    return(resultData)
}

loadScc <- function() {
    message("initialize SCC data set....")
    SCC <- readRDS("./data/Source_Classification_Code.rds")
    SCC
}
