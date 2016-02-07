library(dplyr)
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data.f <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
datesTimes <- strptime(paste(data.f$Date, data.f$Time, sep = " "), "%d/%m/%Y %H:%M:%S") ## read in date/time info in format 'd/m/y h:m:s'
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(data.f$Sub_metering_1)
subMetering2 <- as.numeric(data.f$Sub_metering_2)
subMetering3 <- as.numeric(data.f$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datesTimes, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datesTimes, subMetering2, type="l", col="red")
lines(datesTimes, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() ## close PNG device
