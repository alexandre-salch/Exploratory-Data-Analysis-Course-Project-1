library(lubridate)

# data <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"), colClasses = c(rep("character", 2), rep("numeric", 7)))

data_filtered <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data_filtered$Date <- dmy(data_filtered$Date)
data_filtered$Time <- hms(data$Time)
