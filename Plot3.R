#  Question : has the total emission in Baltimore City, Maryland decreased from 1999 to 2008, by type

library(ggplot2)

# read the relevant data for years 1999, 2002, 2005 and 2008
NEI <- readRDS("summarySCC_PM25.rds")
names(NEI)[4] <- "pm"
NEI <- NEI[NEI$fips=="24510",6:4]
NEI$year <- as.factor(NEI$year)
NEI$type <- as.factor(NEI$type)  

# open a png device and create graph
png(file = "Plot3.png", width = 600, height = 480)
tt <- ggplot(NEI, aes(year, pm, colour = factor(type))) + geom_line() + facet_grid(. ~type)
tt <- tt + xlab("Year") + ylab("Emission Level")
print(tt)
 
# close the graphic device
dev.off()
