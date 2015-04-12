
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
  png(file = "plot1.png",width = 480, height = 480,units = "px",bg = "white")
  
  # Create histogram  to display Global Active Power 
  hist(fl1$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active power (kilowatts)")
  # Close graphic device handle
  dev.off()
  


