plot3 <- function(){
  
  #load data, filter on dates and create kW column
  data <- read.csv("household_power_consumption.txt", sep=";" , na.strings = '?')
  plotData <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
  remove(data)
  plotData$DateTime <- strptime(paste(plotData$Date,plotData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  
  
  #create plot and save it into png file
  png(filename = "plot3.png", width = 480, height = 480)
  with(plotData,plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering",yaxt="n", type="l"))
  axis(2, at=seq(0,30,10))
  with(plotData,lines(DateTime,Sub_metering_2,col="red"))
  with(plotData,lines(DateTime,Sub_metering_3,col="blue"))
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty= c(1,1,1),col = c("black","red","blue"))
  dev.off()
  
  
  
}