#  Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008?  

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
