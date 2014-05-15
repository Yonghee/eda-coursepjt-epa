nei <- readRDS("./data/summarySCC_PM25.rds")

#sum emissions by value from 24510(baltimore)
sumData <- aggregate(Emissions ~ year , nei[nei$fips=='24510',], FUN=sum)

# png("./plot1.png",width=480, height=480)
par(mfrow=c(1,1))
plot(sumData$year, sumData$Emissions,pch=19,xlab="YEAR", ylab="Total Emissions", main="Total Emissions - Baltimore City")
lines(sumData$year, sumData$Emissions, col="blue")
dev.copy(png,"./plot2.png",width=480, height=480)
dev.off()
