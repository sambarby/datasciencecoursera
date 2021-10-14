power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
#we only want to consider dates in the range
#power$Date <- sapply(power$Date, as.character)

dates <- power$Date
times <- power$Time
x <- paste(dates, times)
strptime("17/12/2006 09:12:00", "%d/%m/%y %H:%M:%S")


power$Date <- sapply(power$Date, strpt)
power$Global_active_power <- power$Global_active_power / 500

power <- power %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
#change column from factor to numerical so we can use histogram.
power$Global_active_power <- sapply(power$Global_active_power, as.numeric)
hist(power$Global_active_power, xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", col = 2)

plot(power$Time, power$Global_active_power, lwd = 0.1)
title(ylab = "Global Active Power (kilowatts)", xlab = "Time")
