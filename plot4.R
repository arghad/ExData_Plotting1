plot4 <- function(){
    # Read the data.
    powerData <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
    
    
    # Preprocessing Data        
    powerData$Timestamp = paste(powerData$Date, powerData$Time, sep=" ")
    powerData$Timestamp = strptime(powerData$Timestamp, format="%d/%m/%Y %H:%M:%S")
    
    powerData$Date = as.Date(powerData$Date, format='%d/%m/%Y')
    
    
    # Getting Data between 01-Feb-2006 and 02-Feb-2006
    subData <- subset(powerData, Date == as.Date('2007-02-01',format='%Y-%m-%d') | Date == as.Date('2007-02-02',format='%Y-%m-%d'))    
    
    # Plotting.
    # Set up the plot
    par(mfrow=c(2,2))
    
    # Plot 1,1
    plot(subData$Timestamp, subData$Global_active_power, type="n", ylab="Global Active Power", xlab="")
    lines(subData$Timestamp, subData$Global_active_power, lty=1)
    # Plot 1,2
    plot(subData$Timestamp, subData$Voltage, type="n", ylab="Voltage", xlab="datetime")
    lines(subData$Timestamp, subData$Voltage, lty=1)
    
    # Plot 2,1    
    xrange <- range(subData$Timestamp)
    yrange <- range(subData$Sub_metering_1)    
    plot(xrange, yrange, type="n", ylab="Energy sub metering", xlab="")
    
    lines(subData$Timestamp, subData$Sub_metering_1, lty=1 )
    lines(subData$Timestamp, subData$Sub_metering_2, lty=1, col="red")
    lines(subData$Timestamp, subData$Sub_metering_3, lty=1, col="blue")
    
    legend(strptime("2007-02-02 01:00:00",format="%Y-%m-%d %H:%M:%S"), 39.5 , c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1) ,col=c("black", "red","Blue"), cex=0.55, text.width=strwidth("00000000"))
    
    # Plot 2,2 
    plot(subData$Timestamp, subData$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
    lines(subData$Timestamp, subData$Global_reactive_power, lty=1)
    
    # Printing The PNG File with specific width and height
    dev.copy(png, "plot4.png", width=480, height=480)
    dev.off()    
    
}