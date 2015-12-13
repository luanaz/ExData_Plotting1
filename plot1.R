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
png("plot1.png", width = 480, height = 480)
hist(EPC$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
