library(dplyr)

# Reading Data from file and subsetting to specific dates

data<-read.table("household_power_consumption.txt", 
                 header = TRUE, 
                 sep = ";", 
                 colClasses = c("character","character", rep("numeric",7)), 
                 na.strings = "?")

data_sub<-subset(data,data$Date=="1/2/2007" | data$Date == "2/2/2007")

# converting data and time to specific format and assigning in to a new column"DateTime" 

data_sub$Date <- as.Date(data_sub$Date, format = "%d/%m/%Y")
data_sub$DateTime <- as.POSIXct(paste(data_sub$Date, data_sub$Time))
Sys.setlocale("LC_TIME", "English")

#Plotting

par(mfcol = c(2, 2))


plot(data_sub$DateTime,
     data_sub$Global_active_power,
     type = "line",
     xlab = "",
     ylab = "Global Active Power")



plot(data_sub$DateTime,
     data_sub$Sub_metering_1,
     "n",
     xlab = "",
     ylab = "Energy sub metering")

points(data_sub$DateTime, data_sub$Sub_metering_1, type = "line")

points(data_sub$DateTime,data_sub$Sub_metering_2, type = "line", col = "red")

points(data_sub$DateTime, data_sub$Sub_metering_3, type = "line", col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1),
       bty = "n")

plot(data_sub$DateTime,
     data_sub$Voltage,
     type = "line",
     xlab = "datetime",
     ylab = "Voltage")

plot(data_sub$DateTime,
     data_sub$Global_reactive_power,
     type = "line",
     xlab = "datetime",
     ylab = "Global_reactive_power")
