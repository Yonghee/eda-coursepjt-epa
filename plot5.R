nei <- readRDS("./data/summarySCC_PM25.rds")
scc <- readRDS("./data/Source_Classification_Code.rds")

sccLists <- scc[grepl("mobile",scc$EI.Sector,ignore.case=T) & grepl("vehicles",scc$EI.Sector,ignore.case=T) ,]$SCC

sumData <- nei[(nei$SCC %in% sccLists & nei$fips=="24510"),]
sumData1 <- aggregate(Emissions ~ year, sumData, sum)
par(mfrow=c(1,1))
plot(sumData1$year, sumData1$Emissions,pch=19,xlab="YEAR", ylab="Total Emissions", main="Emissions from motor vehicle sources - Baltimore City")
lines(sumData1$year, sumData1$Emissions, col="blue")
dev.copy(png,"./plot5.png",width=580, height=480)
dev.off()

