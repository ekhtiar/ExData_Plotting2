#read the data frame, which is assumed to be in the data folder, please change accordingly
NEI <- readRDS("./data/summarySCC_PM25.rds")
#store the years to be analysed
years <- c(1999,2002,2005,2008)
#create empty matrix to store result
result <- data.frame(Year = integer(), type = character(), Pollutant = character(), Emissions = integer() )
#run two for loops and subset, the first for loop subsets year and the second for loop subsets that year further by different type
for (i in years ) {
  #subset the data by year
  NEIbyYear <- NEI[NEI$year == i, ]
  for(j in unique(NEIbyYear$type)) {
    #subset further by type
    NEIbyYearandType <- NEI[NEI$type == j, ]
    #store summary of subset in buffer
    buffer <- data.frame(Year = i, 
                         type = j, 
                         Pollutant = "PM25-PRI", 
                         Emissions = mean(NEIbyYear$Emissions, na.rm = TRUE) )
    #store result
    result <- rbind(result,buffer)
  }
}
