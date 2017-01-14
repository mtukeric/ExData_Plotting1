plot4 <- function(){
  
  #load data, filter on dates and create kW column
    data <- read.csv("household_power_consumption.txt", sep=";", na.strings = '?')
  plotData <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
  remove(data)
  plotData$DateTime <- strptime(paste(plotData$Date,plotData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  
  Sys.setlocale("LC_ALL","English")
  #create plots and save them into png file
  png(filename = "plot4.png", width = 480, height = 480)
  par(mfrow=c(2,2))
  # 1. plot
  with(plotData,plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power",main="", type="l"))
  # 2. plot
  with(plotData,plot(DateTime, Voltage, xlab="datetime", ylab="Voltage",main="", type="l"))
  # 3. plot
  with(plotData,plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering",yaxt="n", type="l"))
  axis(2, at=seq(0,30,10))
  with(plotData,lines(DateTime,Sub_metering_2,col="red"))
  with(plotData,lines(DateTime,Sub_metering_3,col="blue"))
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty= c(1,1,1),col = c("black","red","blue"))
  # 4. plot
  with(plotData,plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power",main="", type="l"))
  
  dev.off()
  
  
  
}
