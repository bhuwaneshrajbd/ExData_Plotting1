##Getting data from household_power_consumption.txt file of work directory
AllData <- read.csv("household_power_consumption.txt", header=T, sep=';', nrows=2075260)

AllData$Date <- as.Date(AllData$Date, format="%d/%m/%Y")

##Getting the subset of the data into Subdata
Subdata <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Converting dates to required format
globalActivePower <- as.numeric(Subdata$Global_active_power)
voltage <- as.numeric(Subdata$Voltage)
globalReactivePwr <- as.numeric(Subdata$Global_reactive_power)
Sub_Mtr_1 <- as.numeric(Subdata$Sub_metering_1)
Sub_Mtr_2 <- as.numeric(Subdata$Sub_metering_2)
Sub_Mtr_3 <- as.numeric(Subdata$Sub_metering_3)

#Convert datetime as POSIXct
datetime <- paste(as.Date(Subdata$Date), Subdata$Time)
Subdata$Datetime <- as.POSIXct(datetime)

##Getting Graphical Plot of the subset data "Subdata"
par(mfrow = c(2, 2), mar=c(4,4,2,1), oma=c(0,0,2,0))

##Top Left
plot(globalActivePower~Datetime, data = Subdata, type="l", ylab="Global Active Power", xlab="")

##Bottom Left
plot(voltage~Datetime, data = Subdata, type="l", ylab="Voltage", xlab="datetime")

##Top Right
plot(Sub_Mtr_1~Datetime, data = Subdata, type="l", ylab="Energy sub metering", xlab="")
lines(Sub_Mtr_2~Datetime, data = Subdata, type="l", col = "red")
lines(Sub_Mtr_3~Datetime, data = Subdata, type="l", col = "blue")
legend("topright", col = c("black","red","blue"), lty = 1, lwd = 2, bty="n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Bottom Right
plot(globalReactivePwr~Datetime, data = Subdata, type="l", ylab="Global_reactive_power", xlab="datetime")


##Saving the graph as Plot4.png
dev.copy(png, file="Plot4.png", height=480, width=480)
dev.off()