EPC.header <- read.csv("household_power_consumption.txt",
                       header = TRUE, sep = ";", nrows = 1)#read only one line
                                                           #for obtaining the header
skip.num <- 60*24*(31+15)+(60*6+36)+1
EPC <- read.csv("household_power_consumption.txt",header = FALSE, sep = ";",
                stringsAsFactors = FALSE, na.strings = "?",
                skip = skip.num, nrows = 2880)#get data on 2007-02-01 and 2007-02-02
names(EPC) <- names(EPC.header)
DateTime <- paste(EPC[, "Date"], EPC[, "Time"])
DateTime <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

library(datasets)
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(DateTime, EPC$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
plot(DateTime, EPC$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")
plot(DateTime, EPC$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(DateTime, EPC$Sub_metering_2, col = "red")
lines(DateTime, EPC$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), bty = "n")
plot(DateTime, EPC$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
par(mfrow = c(1, 1))
dev.off()

