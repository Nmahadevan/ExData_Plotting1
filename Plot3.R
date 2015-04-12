  library(data.table) # load Data Table package
  
  # Read input file to variable fl
  
  fl <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
  
  # convert "Date" column as Date type
  
  fl$Date <- as.Date(fl$Date,format = "%d/%m/%Y")
  
  # Combine "Date" & "Time" fields in data frame as one field "Dt" of Date time datatype.
  
  fl$Dt <- strptime(paste(fl$Date,fl$Time),"%Y-%m-%d %H:%M:%S")
  
  # Subset the data frame to look at only two days needed to create the plots.
  
  fl1 <- fl[fl$Date == "2007-02-01" | fl$Date == "2007-02-02",]
 
  #Create png file to store the plot
  
  png(file = "plot3.png",width = 480, height = 480,units = "px",bg = "white")
  # Create Plot to display different Sub Metering type by date with legend
  plot(fl1$Dt,fl1$Sub_metering_1,type = "n",xlab = "", ylab = "Energy sub metering")
  points(fl1$Dt,fl1$Sub_metering_1,type = "l")
  points(fl1$Dt,fl1$Sub_metering_2,type = "l",col = "red")
  points(fl1$Dt,fl1$Sub_metering_3,type = "l",col = "blue")
  legend("topright",lwd = 1,col = c("black","blue","red"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off() # Close graphic device handle

