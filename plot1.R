plot1 <- function(){
    # Read the data.
    powerData <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
    
    
    # Preprocessing Data        
    powerData$Timestamp = paste(powerData$Date, powerData$Time, sep=" ")
    powerData$Timestamp = strptime(powerData$Timestamp, format="%d/%m/%Y %H:%M:%S")
    
    powerData$Date = as.Date(powerData$Date, format='%d/%m/%Y')
    
    
    # Getting Data between 01-Feb-2006 and 02-Feb-2006
    subData <- subset(powerData, Date == as.Date('2007-02-01',format='%Y-%m-%d') | Date == as.Date('2007-02-02',format='%Y-%m-%d'))    
    
    # Plotting.
    hist(subData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
    
    dev.copy(png, "plot1.png", width=480, height=480)
    dev.off()
    
    
}