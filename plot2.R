######
# This R script is to plot a picture with 
# Global Active Power on Y-axis, Day of week on Y-axis.
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

# Plot the picture.
plot(data.sub$Time, data.sub$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     xlab = "", type = "l")

# Copy the plot to a png file, close the file.
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()


