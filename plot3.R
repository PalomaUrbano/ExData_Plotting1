## Load required libraries
library(dplyr)
library(lubridate)

## Read the data. The dataset has 2,075,259 rows and 9 columns 
dt <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric") )

## subset2007-02-01 and 2007-02-02 
dt_s <- subset(dt, Date == "1/2/2007" | Date == "2/2/2007" )

## convert data and time to date 
dt_st <- mutate(dt_s, Date_time = dmy_hms(paste(Date, Time)))

# create graph
plot(dt_st$Date_time,dt_st$Sub_metering_1, ylab ="Energy sub metering", xlab = "", type="n")
lines(dt_st$Date_time,dt_st$Sub_metering_1, col="black")
lines(dt_st$Date_time,dt_st$Sub_metering_2, col="red")
lines(dt_st$Date_time,dt_st$Sub_metering_3, col="blue")
legend("topright",lty=c(1,1,1), col = c("black", "red", "blue"), legend=c("Sub_metering_1" , "Sub_metering_2", "Sub_metering_3"))

# Write the histogram to an png 
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()
