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

# Plotting the histogram

hist(data_sub$Global_active_power,
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
