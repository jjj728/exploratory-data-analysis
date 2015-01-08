library(data.table)

setwd("~/Documents/data science/exploratory data analysis")

data <- fread("grep '^[12]/2/2007' household_power_consumption.txt", sep=";")

colNames <- names(fread("household_power_consumption.txt", header=TRUE, sep=";", nrows=0))

colnames(data) <- colNames

png("hist.png", width = 480, height = 480)

hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

dev.off()

