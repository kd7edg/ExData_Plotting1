# Create plot #2

library(dplyr)
library(lubridate)

rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

rawdata[['Date']] <- as.Date(rawdata$Date, format="%d/%m/%Y")

# create subset of data from just these two dates
data <- subset(rawdata, rawdata$Date == "2007-02-01" | rawdata$Date == "2007-02-02")

# Convert time in factor to POSIXlt
data[['DateTime']] <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S" )

# convert factor columns to numeric
data[['Global_active_power']] <- as.numeric(as.character(data$Global_active_power))
data[['Global_reactive_power']] <- as.numeric(as.character(data$Global_reactive_power))
data[['Voltage']] <- as.numeric(as.character(data$Voltage))
data[['Global_intensity']] <- as.numeric(as.character(data$Global_intensity))
data[['Sub_metering_1']] <- as.numeric(as.character(data$Sub_metering_1))
data[['Sub_metering_2']] <- as.numeric(as.character(data$Sub_metering_2))
data[['Sub_metering_3']] <- as.numeric(as.character(data$Sub_metering_3))

# create png file, create histogram and close graphics device
png(filename = "plot2.png", width = 480, height = 480)
with(data, plot(DateTime, Global_active_power, type="l", 
                xlab="", ylab="Global Active Power (kilowatt)"))
dev.off()
