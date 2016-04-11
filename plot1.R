# As the data set "household_power_consumption.txt" is not part of the repo, make
# sure that this file is just in the parent folder containing this repo.
# 2 days = 2880 minutes, First read with 2880 rows after skipping 66637 rows to reach February 1st, 2007
# Next read the same table with one row to obtain names
# Date & Time is merged to obtain one column and that column is added 
# and formatted
# Plots are produced per question asked
# Plot1.R does not require all this processing to produce the histogram but did it
# to help other plots.
hh_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", skip = 66637, nrows = 2880)

hh_data_names <- read.table("household_power_consumption.txt", header = TRUE, sep= ";", nrows = 1)

names(hh_data) <- names(hh_data_names)

date_time <- paste(hh_data$Date, hh_data$Time)
hh_data_new$date_time <- as.data.frame(date_time)
hh_data_new <- cbind(date_time, hh_data)
hh_data_new$date_time <- strptime(hh_data_new$date_time, "%d/%m/%Y %H:%M")

png(filename = "./ExData_Plotting1/plot1.png", width = 480, height = 480, units = "px")

hist(hh_data_new$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()





                         