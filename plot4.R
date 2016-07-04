d <- read.table("household_power_consumption.txt", sep = ";",
                header = T, stringsAsFactors = F)
con <- subset(d, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- strptime(paste(con$Date, con$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalactivepower <- as.numeric(con$Global_active_power)
globalreactivepower <- as.numeric(con$Global_reactive_power)
voltage <- as.numeric(con$Voltage)

submeter1 <- con$Sub_metering_1
submeter2 <- con$Sub_metering_2
submeter3 <- con$Sub_metering_3

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime,submeter1,type="l",xlab = "",ylab="Energy Sub Metering")
lines(datetime,submeter2,col="red")
lines(datetime,submeter3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,lwd=2,col=c("black","red","blue"),bty="n")

plot(datetime, globalreactivepower, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()
