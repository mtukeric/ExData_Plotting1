plot2 <- function(){
  
  #load data, filter on dates and datetime column
  data <- read.csv("household_power_consumption.txt", sep=";", na.strings = '?')
  plotData <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
  remove(data)
  plotData$DateTime <- strptime(paste(plotData$Date,plotData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  
  
  #create plot and save it into png file
  png(filename = "plot2.png", width = 480, height = 480)
  with(plotData,plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)",main="", type="l"))
  #dev.copy(png,'plot1.png')
  dev.off()
  
  
  
}