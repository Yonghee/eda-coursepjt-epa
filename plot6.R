nei <- readRDS("./data/summarySCC_PM25.rds")
scc <- readRDS("./data/Source_Classification_Code.rds")

sccLists <- scc[grepl("mobile",scc$EI.Sector,ignore.case=T) & grepl("vehicles",scc$EI.Sector,ignore.case=T) ,]$SCC
sumData <- nei[(nei$SCC %in% sccLists & (nei$fips=="24510" | nei$fips=="06037") ),]

idxCols = c("fips","year")
sumCols = c("Emissions")


sumData <- ddply(sumData, idxCols, function(x) colSums(x[sumCols]))
sumData$fips <- factor(sumData$fips,labels=c("Los Angeles County","Baltimore City"))

par(mfrow=c(1,1))
g <- ggplot(data=sumData, aes(x=year, y=Emissions, group = fips, colour = fips))
g <- g + ggtitle("Compare emissions from motor vehicle ( Baltimore vs. LA)") + xlab("YEAR") + ylab("Emissions by Fips") 
g <- g + geom_line(size=0.3)
g <- g + geom_point(size=2, shape=21, fill="white")
g <- g + theme(text = element_text(size=5)) 
ggsave(filename="./plot6.png", width=4, height=3)
dev.off()

