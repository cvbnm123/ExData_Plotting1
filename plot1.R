## We are going to read the data into R:
household_power_consumption <- read.table(file = 
                 "household_power_consumption.txt", header = TRUE, sep = ";")

## Convert Dates to Date format
household_power_consumption[,"Date"] <- as.Date(household_power_consumption
                                                [,"Date"],format = "%d/%m/%Y")

## Subsetting Dates from dataset:
subset_data <- subset(household_power_consumption, Date == "2007-02-01" | 
                              Date == "2007-02-02")

## Convert Global_active_power to numeric format
global_active_power <- as.numeric(subset_data[, "Global_active_power"])

## Create and save plot 1, a Histogram:
png("plot1.png", width = 480, height = 480)
hist(global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()