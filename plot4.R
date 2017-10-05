## Getting full dataset
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, sep=";", header = TRUE, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
subSetData <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(subSetData$Date), subSetData$Time)
subSetData$Datetime <- as.POSIXct(datetime)

## Plot 4

globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(subSetData$Datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(subSetData$Datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(subSetData$Datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(subSetData$Datetime, subMetering2, type="l", col="red")
lines(subSetData$Datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(subSetData$Datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()