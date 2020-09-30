# Reading data 
powercons <- read.csv("household_power_consumption.txt", sep = ";")

# Changing to class from character to numeric, time or date  
powercons$Date <- as.Date(powercons$Date, format="%d/%m/%Y")
powercons$Time <- strptime(powercons$Time) #still need to work on this
powercons$DateTime <- strptime(paste(powercons$Date, powercons$Time), format = "%Y-%m-%d %H:%M:%S")
powercons$Global_active_power <- as.numeric(powercons$Global_active_power)
powercons$Global_reactive_power <- as.numeric(powercons$Global_reactive_power)
powercons$Voltage <- as.numeric(powercons$Voltage)
powercons$Global_intensity <- as.numeric(powercons$Global_intensity)
powercons$Sub_metering_1 <- as.numeric(powercons$Sub_metering_1)
powercons$Sub_metering_2 <- as.numeric(powercons$Sub_metering_2)
powercons$Sub_metering_3 <- as.numeric(powercons$Sub_metering_3)

# Selecting right dates
power <- powercons[powercons$Date >= "2007-2-1" & powercons$Date <= "2007-2-2",]

# Plot graph 3
with(power, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l"))
with(power, points(DateTime, Sub_metering_2, col = "red", type = "l"))
with(power, points(DateTime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", " Sub_metering_3"))
dev.copy(png, width = 480, height = 480, file = "Plot3.png")
dev.off()