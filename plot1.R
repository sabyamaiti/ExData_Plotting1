## Getting full dataset
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, sep=";", header = TRUE, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
subSetData <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Plot 1
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()