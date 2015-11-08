library(dplyr)
library(lubridate)
Sys.setlocale("LC_TIME", "en_GB.UTF-8")

data <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"), colClasses = c(rep("character", 2), rep("numeric", 7)))

data_filtered <- data %>% 
  filter(Date == "1/2/2007" | Date == "2/2/2007") %>% 
  mutate(datetime = dmy_hms(paste(Date, Time, sep = " ")))


png(filename = "plot2.png")
with(data_filtered, plot(datetime, Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power (kilowatt)"))
dev.off()
