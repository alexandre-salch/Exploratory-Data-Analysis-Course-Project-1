library(dplyr)
library(lubridate)
Sys.setlocale("LC_TIME", "en_GB.UTF-8")

data <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"), colClasses = c(rep("character", 2), rep("numeric", 7)))

data_filtered <- data %>% 
  filter(Date == "1/2/2007" | Date == "2/2/2007") %>% 
  mutate(datetime = dmy_hms(paste(Date, Time, sep = " ")))


png(filename = "plot3.png")
with(data_filtered, {
  plot(datetime, Sub_metering_1, type = "n", xlab = NA, ylab = "Energy sub metering")
  points(datetime, Sub_metering_1, type = "l", col = "black")
  points(datetime, Sub_metering_2, type = "l", col = "red")
  points(datetime, Sub_metering_3, type = "l", col = "blue")
})
legend("topright", pch=NA, lty=1, col = c("black", "red", "blue"), legend = names(data_filtered)[7:9])
dev.off()
