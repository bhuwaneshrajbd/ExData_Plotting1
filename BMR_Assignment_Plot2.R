##Getting data from household_power_consumption.txt file of work directory
AllData <- read.csv("household_power_consumption.txt", header=T, sep=';', nrows=2075260)

AllData$Date <- as.Date(AllData$Date, format="%d/%m/%Y")

##Getting the subset of the data into Subdata
Subdata <- subset(AllData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Converting dates to required format
datetime <- paste(as.Date(Subdata$Date), Subdata$Time)
Subdata$Datetime <- as.POSIXct(datetime)

##Saving the graph as Plot2.png
plot(Subdata$Global_active_power~Subdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()