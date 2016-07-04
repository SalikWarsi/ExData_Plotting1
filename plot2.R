d <- read.table("household_power_consumption.txt", sep = ";",
                header = T, stringsAsFactors = F)
con <- subset(d, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- strptime(paste(con$Date, con$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalactivepower <- as.numeric(con$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime,globalactivepower,type="l",
     xlab="",ylab="Global Actie Power (kilowatts")
dev.off()