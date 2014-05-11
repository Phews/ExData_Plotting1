setwd("c:/work/data scientist/course 4 - assignment 1/")
library( "sqldf" )


df <- read.csv.sql("household_power_consumption.txt", "select * from file where Date in ('1/2/2007', '2/2/2007')", sep=";")

df$DateTime <- strptime( paste( df$Date, df$Time ), format="%d/%m/%Y %H:%M:%S")

library( datasets )

png( file="plot1.png",width=480, height=480)

hist( df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

