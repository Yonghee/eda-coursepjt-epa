nei <- readRDS("./data/summarySCC_PM25.rds")
scc <- readRDS("./data/Source_Classification_Code.rds")

#extract scc code from SCC where coal combustion-related sources 
sccLists <- scc[grepl("coal",scc$EI.Sector, ignore.case=T) & grepl("comb",scc$EI.Sector, ignore.case=T),]$SCC
sumData <- nei[nei$SCC %in% sccLists,]
sumData1 <- aggregate(Emissions ~ year, sumData, sum)
par(mfrow=c(1,1))
plot(sumData1$year, sumData1$Emissions,pch=19,xlab="YEAR", ylab="Total Emissions", main="Emissions from coal combustion across the US")
lines(sumData1$year, sumData1$Emissions, col="blue")
dev.copy(png,"./plot4.png",width=480, height=480)
dev.off()

