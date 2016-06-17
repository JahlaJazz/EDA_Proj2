# Exploratory Data Analysis Course Project 2

## Overview
 Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that itis harmful to human health. 
 In the United States, the Environmental Protection  Agency (EPA) is tasked with setting national ambient air quality standards for
 fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database
 on emissions of PM2.5. This  database is known as the National Emissions Inventory (NEI). 

 For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course
 of the entire year. The data that you will use for this assignment are for 1999, 2002, 2005, and 2008.
 
## Data :
   The data for this assignment are available from the course web site as a single zip file: "exdata_data_NEI_data.zip"     

    The zip file contains two files:
    a. PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data
       for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of zpM2.5 emitted from a specific
       type of source for the entire year.
    b. Source Classification Code Table (Source_Classification_Code.rds): This table provides a mapping from the SCC digit 
       strings in the Emissions table to the actual name of the PM2.5 source.

 
## Focus and Issues addressed
   Question 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
   
               Result: The average emission levels, across the US has decreased from 1999 to 2008.
                       The results can be reproduced by running Plot1.R and reviewing Plot1.png  
   
   Question 2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
   
               Result: The average emission level has decrease for all years under review, except for 2005.
                       The results can be reproduced by running Plot2.R and reviewing Plot2.png  
               
   Question 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
               which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
               Which have seen increases in emissions from 1999–2008?  
   
               Results: The emision levels for types nonpoint and onroad decreased over 1999-2008. 
                        However the emission level for type nonroad and point increased for years 2002 and 2005.
                        The applicable script is Plot3.R and the resulting graph is Plot3.png
               
   Question 4: Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
   
