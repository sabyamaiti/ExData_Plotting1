## Getting full dataset
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, sep=";", header = TRUE, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
subSetData <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(subSetData$Date), subSetData$Time)
subSetData$Datetime <- as.POSIXct(datetime)

## Plot 2
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(globalActivePower~subSetData$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()