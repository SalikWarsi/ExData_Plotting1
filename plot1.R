d <- read.table("household_power_consumption.txt", sep = ";",
                header = T, stringsAsFactors = F)
con <- subset(d, Date == "1/2/2007" | Date == "2/2/2007")

globalactivepower <- as.numeric(con$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalactivepower, col = "red",
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()