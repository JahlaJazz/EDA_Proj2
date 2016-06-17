# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 

# read the relevant data for years 1999, 2002, 2005 and 2008
NEI <- readRDS("summarySCC_PM25.rds")
names(NEI)[4] <- "pm"

# open a png device and create graph
png(file = "Plot1.png", width = 600, height = 480)

tt <- aggregate(pm~year,NEI,mean)  
barplot(height=round(tt$pm,2), names.arg = tt$year, main = "Average Emission Level Across US", col = c("blue", "red", "yellow", "green"), xlab = "Year", ylab = "Average Emission")
points(seq(tt$year),round(tt$pm,2), type = "o", col = "black", pch = 19)

# close the graphic device
dev.off()
