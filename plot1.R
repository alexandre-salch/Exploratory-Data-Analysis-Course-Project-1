library(dplyr)
library(lubridate)

data <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"), colClasses = c(rep("character", 2), rep("numeric", 7)))

data_filtered <- data %>% 
  filter(Date == "1/2/2007" | Date == "2/2/2007")  

png(filename = "plot1.png")
with(data_filtered, hist(Global_active_power, col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()
