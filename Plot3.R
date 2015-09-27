#read the data frame, which is assumed to be in the data folder, please change accordingly
NEI <- readRDS("./data/summarySCC_PM25.rds")
#store the years to be analysed
years <- c(1999,2002,2005,2008)
#create empty matrix to store result
result <- data.frame(Year = integer(), type = character(), Pollutant = character(), Emissions = integer() )
#subset the data for Baltimore City, Maryland (fips == "24510")
NEIbyArea <- NEI[NEI$fips == "24510", ]
#aggregate by area and 
aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, NEIbyArea, sum)

png("./plot3.png", width=480, height=480)
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()

