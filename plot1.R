## Coursera - Exploratory Data Analysis - Plotting Assignment 1
## Alexis Segovia from Venezuela
## plot1.R and generate plot1.png

## Assignment of the data file from the working directory

filename <- "C://Exploratory//Data//household_power_consumption.txt"

## Reading the data from the filename

data = read.csv(filename, header=TRUE,
                    sep=";", na.strings="?", colClasses=c("character", "character","numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric"))

## Using and formatting data from the dates 2007-02-01 and 2007-02-02

data$Date = as.Date(data$Date, format="%d/%m/%Y")
initDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
data = data[data$Date >= initDate & data$Date <= endDate, ]

## Creating the plot

png(filename="plot1.png", width=480, height=480)
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()
