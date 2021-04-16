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

## Convert Global_active_power to numeric format
global_active_power <- as.numeric(subset_data[, "Global_active_power"])

## Generating plot 2 and saving it as png
png("plot2.png", width = 480, height = 480)
plot(date_time, global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()