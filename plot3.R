######
# This R script is to plot a histogram with 
# Energy sub metering on X-axis, Frequency on Y-axis.
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
png("plot3.png", height = 480, width = 480)

# Plot the 3 Energy sub metering graphs with different colours and a legend.
with(data.sub, {
     plot(Time, Sub_metering_1, col = "black",
          ylab = "Energy sub metering", xlab = "", type = "l")
     lines(Time, Sub_metering_2, col = "red")
     lines(Time, Sub_metering_3, col = "blue")
    })

# Mark the legend.
legend("topright", col = c("black", "red", "blue"),  lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the PNG device.
dev.off()

