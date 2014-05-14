require("plyr")
require("ggplot2")


nei <- readRDS("./data/summarySCC_PM25.rds")

idxCols = c("type","year")
sumCols = c("Emissions")


sumData <- ddply(nei[nei$fips=='24510',], idxCols, function(x) colSums(x[sumCols]))

par(mfrow=c(1,1))
g <- ggplot(data=sumData, aes(x=year, y=Emissions, group = factor(type), colour = type))
g <- g + ggtitle("Change of Emissions by Type(Baltimore City)") + xlab("YEAR") + ylab("Emissions by Type") 
g <- g + geom_line(size=0.3)
g <- g + geom_point(size=2, shape=21, fill="white")
g <- g + theme(text = element_text(size=5)) 
ggsave(filename="./plot3.png", width=4, height=3)
#print(g)
dev.off()
