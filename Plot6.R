# Question : Compare emissions from motor vehicle sources in Baltimore City with emissions from                   motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city
# has seen greater changes over time in motor vehicle emissions?
library(dplyr)

# read the relevant data for years 1999, 2002, 2005 and 2008
NEI <- readRDS("summarySCC_PM25.rds")

Balt <- NEI[NEI$fips=="24510",]
Balt$City <- rep("Baltimore", nrow(Balt))
LA <- NEI[NEI$fips=="06037",]
LA$City <- rep("Los Angeles", nrow(LA))
NEI <- rbind(Balt,LA)
names(NEI)[4] <- "pm"
NEI$year <- as.factor(NEI$year)
NEI$City <- as.factor(NEI$City)  

SCC <- readRDS("Source_Classification_Code.rds")
SCC <- SCC[SCC$Data.Category == "Onroad" ,c(1:4,7:10)]
 
both <- intersect(NEI$SCC,SCC$SCC)
NEI.SCC <- merge(NEI,SCC, by = both, by.x = "SCC", by.y = "SCC")

# open a png device and create graph
png(file = "Plot6.png", width = 600, height = 480)

tt <- ggplot(NEI.SCC, aes(year, pm, colour = factor(City))) + geom_point() + facet_grid(. ~City)
tt <- tt + ggtitle("Motor Vehicle Emission in Baltimore vs Los Angeles from 1999 - 2008")
tt <- tt + xlab("Year") + ylab("Emission")
print(tt)

# close the graphic device
dev.off()
