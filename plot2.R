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

png(filename='plot2.png', width=480, height=480, units='px')

#Plot line graph

plot(data_sub$DateTime, data_sub$Global_active_power, 
     type="line", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")