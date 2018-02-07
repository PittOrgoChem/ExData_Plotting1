power <- read.table("household_power_consumption.txt", header = FALSE, sep=";", stringsAsFactors = FALSE)
colnames(power) <- power[1, ]
power = power[-1, ]
power[, 1] <- as.Date(power$Date, "%d/%m/%Y")
useful <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")
useful[, "Global_active_power"] <- as.numeric(useful$Global_active_power)
useful$Date <- paste(useful$Date, useful$Time, sep=" ")
useful$Date <- as.POSIXlt(useful$Date)
plot(useful$Date, useful$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
