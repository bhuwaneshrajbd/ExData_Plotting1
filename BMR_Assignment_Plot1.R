##Getting data from household_power_consumption.txt file of work directory
AllData <- read.csv("household_power_consumption.txt", header=T, sep=';', nrows=2075260)

AllData$Date <- as.Date(AllData$Date, format="%d/%m/%Y")

##Getting the subset of the data into Subdata
Subdata <- subset(AllData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Converting dates to required format
datetime <- paste(as.Date(Subdata$Date), Subdata$Time)
Subdata$Datetime <- as.POSIXct(datetime)

##Getting Graphical Plot of the subset data "Subdata"
hist(as.numeric(Subdata$Global_active_power), xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")

##Saving the graph as Plot1.png
dev.copy(png, file="Plot1.png", height=480, width=480)
dev.off()
