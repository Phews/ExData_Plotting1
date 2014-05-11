setwd("c:/work/data scientist/course 4 - assignment 1/")
library( "sqldf" )


df <- read.csv.sql("household_power_consumption.txt", "select * from file where Date in ('1/2/2007', '2/2/2007')", sep=";")

df$DateTime <- strptime( paste( df$Date, df$Time ), format="%d/%m/%Y %H:%M:%S")

library( datasets )

png( file="plot4.png",width=480, height=480)

par(mfcol=c(2,2))

with( df, plot( DateTime, Global_active_power, type="n", main="", ylab="Global Active Power (kilowatts)", xlab=""))
with( df, lines( DateTime, Global_active_power))

with( df, plot( DateTime, Sub_metering_1, type="n", main="", ylab="Energy sub metering", xlab=""))
with( df, lines( DateTime, Sub_metering_1, col="black"))
with( df, lines( DateTime, Sub_metering_2, col="red"))
with( df, lines( DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1), col = c("black", "red", "blue"), bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


with( df, plot( DateTime, Voltage, main="", type="n", xlab="datetime"))
with( df, lines( DateTime, Voltage))

with( df, plot( DateTime, Global_reactive_power, main="", type="n", xlab="datetime"))
with( df, lines( DateTime, Global_reactive_power))


dev.off()

