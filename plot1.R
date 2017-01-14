plot1 <- function(){

#load data, filter on dates and create kW column
data <- read.csv("household_power_consumption.txt", sep=";")
plotData <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
remove(data)
plotData$GlobalActivePowerkW <- as.numeric(plotData$Global_active_power) / 1000

#create histogram and save it into png file
png(filename = "plot1.png", width = 480, height = 480)
with(plotData,hist(GlobalActivePowerkW, xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red"))
#dev.copy(png,'plot1.png')
dev.off()



}