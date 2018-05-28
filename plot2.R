#reads in data and subsets to appropriate sample
fulldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#fixes date/time data
timeschar <- paste(fulldata$Date,fulldata$Time,sep = " ")
times <- strptime(timeschar, format = "%d/%m/%Y %H:%M:%S")
fulldata$Time <- times
dates <- as.Date(as.character(fulldata$Date), format = "%d/%m/%Y")
fulldata$Date <- dates

selectdata <- subset(fulldata,Date=="2007-2-1"|Date=="2007-2-2")

#sets numeric vectors to numeric class
selectdata$Global_active_power <- as.numeric(as.character(selectdata$Global_active_power))
selectdata$Global_reactive_power <- as.numeric(as.character(selectdata$Global_reactive_power))
selectdata$Voltage <- as.numeric(as.character(selectdata$Voltage))
selectdata$Global_intensity <- as.numeric(as.character(selectdata$Global_intensity))
selectdata$Sub_metering_1 <- as.numeric(as.character(selectdata$Sub_metering_1))
selectdata$Sub_metering_2 <- as.numeric(as.character(selectdata$Sub_metering_2))
selectdata$Sub_metering_3 <- as.numeric(as.character(selectdata$Sub_metering_3))

#Plot 2
with(selectdata,plot(Time,
                     Global_active_power,
                     pch = NA_integer_,
                     ylab = "Global Active Power (millions)",
                     xlab = ""))
with(selectdata,lines(Time,
                      Global_active_power,
                      type = "l"))

dev.copy(png, "plot2.png")
dev.off()