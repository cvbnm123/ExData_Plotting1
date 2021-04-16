## We are going to read the data into R:
household_power_consumption <- read.table(file = 
                                                  "household_power_consumption.txt", header = TRUE, sep = ";")

## Convert Dates to Date format
household_power_consumption[,"Date"] <- as.Date(household_power_consumption
                                                [,"Date"],format = "%d/%m/%Y")

## Subsetting Dates from dataset:
subset_data <- subset(household_power_consumption, Date == "2007-02-01" | 
                              Date == "2007-02-02")

## Date Time format:
date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

## Convert Sub_metering to numeric format
sub_metering_1 <- as.numeric(subset_data[, "Sub_metering_1"])
sub_metering_2 <- as.numeric(subset_data[, "Sub_metering_2"])
sub_metering_3 <- as.numeric(subset_data[, "Sub_metering_3"])

## Plotting Sub_metering and saving it as png
plot(date_time, sub_metering_1, col = "black", type = "l", xlab = " ", ylab = "Energy sub metering")
lines(date_time, sub_metering_2, col = "red")
lines(date_time, sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black","red","blue"))
dev.off()