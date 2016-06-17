#  Question Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
#  from 1999 to 2008? 

# read the relevant data for years 1999, 2002, 2005 and 2008
NEI <- readRDS("summarySCC_PM25.rds")
names(NEI)[4] <- "pm"
NEI <- NEI[NEI$fips=="24510",]

# open a png device and create graph
png(file = "Plot2.png", width = 600, height = 480)

tt <- aggregate(pm~year,NEI,mean)  
barplot(height=round(tt$pm,2), names.arg = tt$year, main = "Average Emission Level in Baltimore, Maryland", col = c("blue", "red", "yellow", "green"),xlab = "Year", ylab = "Average Emission"   )
points(seq(tt$year),round(tt$pm,2), type = "o", col = "black", pch = 19)

# close the graphic device
dev.off()
