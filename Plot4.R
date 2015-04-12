  library(data.table) # load Data Table package
  
  # Read input file to variable fl
  
  fl <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
  
  # convert "Date" column as Date type
  
  fl$Date <- as.Date(fl$Date,format = "%d/%m/%Y")
  
  # Combine "Date" & "Time" fields in data frame as one field "Dt" of Date time datatype.
  
  fl$Dt <- strptime(paste(fl$Date,fl$Time),"%Y-%m-%d %H:%M:%S")
  
  # Subset the data frame to look at only two days needed to create the plots.
  
  fl1 <- fl[fl$Date == "2007-02-01" | fl$Date == "2007-02-02",]
  #Create png file to store the plots
  png(file = "plot4.png",width = 480, height = 480,units = "px",bg = "white")
  # Initialize PAR variables so that 4 plots can be created in a single file
  par(mfrow = c(2, 2), mar = c(4, 4, 4, 2))
  # Create Plot 1 
  plot(fl1$Dt,fl1$Global_active_power,type="l", xlab = "", ylab = "Global Active power")
  # Create Plot 2
  plot(fl1$Dt,fl1$Voltage,type ="l",xlab = "datetime", ylab = "Voltage")
  # Create Plot 3
  plot(fl1$Dt,fl1$Sub_metering_1,type = "n",xlab = "", ylab = "Energy sub metering")
  points(fl1$Dt,fl1$Sub_metering_1,type = "l")
  points(fl1$Dt,fl1$Sub_metering_2,type = "l",col = "red")
  points(fl1$Dt,fl1$Sub_metering_3,type = "l",col = "blue")
  legend("topright",lwd = 1,col = c("black","blue","red"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")
  # Create Plot 4
  plot(fl1$Dt,fl1$Global_reactive_power,type ="l",xlab = "datetime", ylab = "Global_reactive_power")
  dev.off()  # Close graphic device handle
