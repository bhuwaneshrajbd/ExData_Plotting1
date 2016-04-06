##Getting data from household_power_consumption.txt file of work directory
AllData <- read.csv("household_power_consumption.txt", header=T, sep=';', nrows=2075260)

AllData$Date <- as.Date(AllData$Date, format="%d/%m/%Y")

##Getting the subset of the data into Subdata
Subdata <- subset(AllData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Converting dates to required format
Sub_Mtr_1 <- as.numeric(Subdata$Sub_metering_1)
Sub_Mtr_2 <- as.numeric(Subdata$Sub_metering_2)
Sub_Mtr_3 <- as.numeric(Subdata$Sub_metering_3)
datetime <- paste(as.Date(Subdata$Date), Subdata$Time)
Subdata$Datetime <- as.POSIXct(datetime)

##Getting Graphical Plot of the subset data "Subdata"
plot(Sub_Mtr_1~Datetime, data = Subdata, type="l", ylab="Energy sub metering", xlab="")
lines(Sub_Mtr_2~Datetime, data = Subdata, type="l", col = "red")
lines(Sub_Mtr_3~Datetime, data = Subdata, type="l", col = "blue")
legend("topright", col = c("black","red","blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Saving the graph as Plot3.png
dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()