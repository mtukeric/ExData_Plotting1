plot1 <- function(){

#load data, filter on dates
data <- read.csv("household_power_consumption.txt", sep=";", na.strings = '?')
plotData <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
remove(data)

#create histogram and save it into png file
png(filename = "plot1.png", width = 480, height = 480)
with(plotData,hist(Global_active_power, xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red"))
#dev.copy(png,'plot1.png')
dev.off()



}