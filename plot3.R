library(data.table)

setwd("~/Documents/data science/exploratory data analysis")

data <- fread("grep '^[12]/2/2007' household_power_consumption.txt", sep=";")

colNames <- names(fread("household_power_consumption.txt", header=TRUE, sep=";", nrows=0))

colnames(data) <- colNames

x <- data[, strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")]

Sys.setlocale('LC_TIME', 'C')

png("plot3.png", width = 480, height = 480)

plot(x, data$Sub_metering_1, type='l', main='', xlab='', ylab='Global Active Power (kilowatts)')

lines(x, data$Sub_metering_2, col="red")

lines(x, data$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1),
       col=c("black","blue","red"))

dev.off()