
nei <- readRDS("./data/summarySCC_PM25.rds")

#Sum emissions value by year
sumData <- aggregate(Emissions ~ year , nei, FUN=sum)

par(mfrow=c(1,1))
plot(sumData$year, sumData$Emissions,pch=19,xlab="YEAR", ylab="Total Emissions", main="Total Emissions from across USA")
lines(sumData$year, sumData$Emissions, col="blue")
dev.copy(png,"./plot1.png",width=480, height=480)
dev.off()
