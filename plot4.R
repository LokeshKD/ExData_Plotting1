######
# This R script is to plot 4 graphs as per assignment.
# We are in the working directory where household_power_consumption.txt is present.
######


# Read the file and form a dataset apporpriately.
data <- read.table("household_power_consumption.txt", 
                   header = TRUE,
                   sep = ";", 
                   na.strings = "?")

# Convert the Time variable, properly.
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Convert the Date variable to Date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Get the subset of data based on dates of interest.
data.sub <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",] 

# Open the png Graphics device.
png("plot4.png", height = 480, width = 480)

# Form a grid with 2X2 and margin set appropriately.
par(mfrow = c(2,2), mar = c(4,4,4,2))

# Plot the first graph. - plot1.R
with(data.sub, plot(Time, Global_active_power,
                    ylab = "Global Active Power (kilowatts)",
                    xlab = "", type = "l"))

# Plot the 2nd graph. Day vs Voltage.
with(data.sub, plot(Time, Voltage, xlab = "datetime", type = "l"))

# Plot the 3rd graph. - Plot3.R
# Plot the 3 Energy sub metering graphs with different colours and a legend.
with(data.sub, {
  plot(Time, Sub_metering_1, col = "black",
       ylab = "Energy sub metering", xlab = "", type = "l")
  lines(Time, Sub_metering_2, col = "red")
  lines(Time, Sub_metering_3, col = "blue")
  
  # Mark the legend with no box.
  legend("topright", col = c("black", "red", "blue"),  lty = 1, bty ="n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# Plot the 4th graph. Time vs Global Active Power.
with(data.sub, plot(Time, Global_reactive_power, xlab = "datetime", type = "l"))

# Close the PNG device.
dev.off()