library(dplyr)
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data.f <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
## read in date/time info in format 'd/m/y h:m:s'
datesTimes <- strptime(paste(data.f$Date, data.f$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data.f$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datesTimes, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() ## close PNG device