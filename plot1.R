######
# This R script is to plot a histogram with 
# Global Active Power on X-axis, Frequency on Y-axis.
# We are in the working directory where household_power_consumption.txt is present.
######


# Read the file and form a dataset apporpriately.
data <- read.table("household_power_consumption.txt", 
                   header = TRUE,
                   sep = ";", 
                   na.strings = "?")


# Convert the Date variable to Date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")


# Get the subset of data based on dates of interest.
data.sub <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",] 

# Plot the histogram
# By default y-axis lable is set to Frequency, so no need to set it explicitly.
hist(data.sub$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Copy the histogram to a png file, close the file.
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
