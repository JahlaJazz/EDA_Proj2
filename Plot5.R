# Question : How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
# changed from 1999-2008?
library(dplyr)

# read the relevant data for years 1999, 2002, 2005 and 2008
NEI <- readRDS("summarySCC_PM25.rds")
NEI <- NEI[NEI$fips=="24510",]
names(NEI)[4] <- "pm"

SCC <- readRDS("Source_Classification_Code.rds")
SCC <- SCC[SCC$Data.Category == "Onroad" ,c(1:4,7:10)]

 
both <- intersect(NEI$SCC,SCC$SCC)
NEI.SCC <- merge(NEI,SCC, by = both, by.x = "SCC", by.y = "SCC")


# open a png device and create graph
png(file = "Plot5.png", width = 600, height = 480)

tt <- aggregate(pm~year,NEI.SCC,mean)  
barplot(height=round(tt$pm,2), names.arg = tt$year, main = "Average Emission from Motor Vehicles in Baltimore, Maryland", col = c("blue", "red", "yellow", "green"), xlab = "Year", ylab = "Emission")
points(seq(tt$year),round(tt$pm,2), type = "o", col = "black", pch = 19)

# close the graphic device
dev.off()
