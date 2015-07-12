## Coursera - Exploratory Data Analysis - Plotting Assignment 1
## Alexis Segovia from Venezuela
## plot3.R and generate plot3.png

## Assignment of the data file from the working directory

filename <- "C://Exploratory//Data//household_power_consumption.txt"

## Reading the data from the filename

data = read.csv(filename, header=TRUE,
                sep=";", na.strings="?", colClasses=c("character", "character","numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric"))


## Using and formatting data from the dates 2007-02-01 and 2007-02-02

data$timestamp = strptime(paste(data$Date, data$Time),
                              format="%d/%m/%Y %H:%M:%S", tz="UTC")
initDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
data = data[data$timestamp >= initDate & data$timestamp <= endDate, ]

## Creating the plot
png(filename="plot3.png", width=480, height=480)
plot(data$timestamp, data$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(data$timestamp, data$Sub_metering_2, col="red")
lines(data$timestamp, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"))
dev.off()
