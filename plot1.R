library(dplyr)
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data.f <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
globalActivePower <- as.numeric(data.f$Global_active_power)
png("plot1.png", width=480, height=480) ## Create PNG file
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") ## Create histogram
dev.off() ## close PNG device