## We are going to read the data into R:
household_power_consumption <- read.table(file = 
                                                  "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

## Convert Dates to Date format
household_power_consumption[,"Date"] <- as.Date(household_power_consumption
                                                [,"Date"], format = "%d/%m/%Y")

## Subsetting Dates from dataset:
subset_data <- subset(household_power_consumption, Date == "2007-02-01" | 
                              Date == "2007-02-02")

## Date Time format:
date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), 
                      "%Y-%m-%d %H:%M:%S")

## Convert Sub_metering to numeric format
sub_metering_1 <- as.numeric(subset_data[, "Sub_metering_1"])
sub_metering_2 <- as.numeric(subset_data[, "Sub_metering_2"])
sub_metering_3 <- as.numeric(subset_data[, "Sub_metering_3"])

## Convert Global_active_power to numeric format
global_active_power <- as.numeric(subset_data[, "Global_active_power"])

## Convert Voltage to numeric format
voltage <- as.numeric(subset_data[, "Voltage"])

## Convert Global_reactive_power to numeric format
global_reactive_power <- as.numeric(subset_data[, "Global_reactive_power"])

## 4 Plots together organized by collumn
png("plot4.png", width = 480, height = 480) # save plot as png
par(mfcol = c(2, 2)) # 4 Plots together organized by collumn
par(mar = c(4, 4, 2, 2)) # set smaller margins

# 1st plot
plot(date_time, global_active_power, 
     ylab = "Global Active Power (kilowatts)", xlab = "")

# 2nd plot
plot(date_time, sub_metering_1, col = "black", type = "l", xlab = " ", ylab = "Energy sub metering")
lines(date_time, sub_metering_2, col = "red")
lines(date_time, sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black","red","blue"))

# 3rd plot
plot(date_time, voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# 4th plot
plot(date_time, global_reactive_power, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")

dev.off()