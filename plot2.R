library(data.table)

setwd("~/Documents/data science/exploratory data analysis")

data <- fread("grep '^[12]/2/2007' household_power_consumption.txt", sep=";")

colNames <- names(fread("household_power_consumption.txt", header=TRUE, sep=";", nrows=0))

colnames(data) <- colNames

x <- data[, strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")]

Sys.setlocale('LC_TIME', 'C')

png("plot2.png", width = 480, height = 480)

plot(x, data$Global_active_power, type='l', main='', xlab='', ylab='Global Active Power (kilowatts)')

dev.off()