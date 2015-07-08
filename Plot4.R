# Exploratory Data Analysis Project 1, plot 4

# Import data from file
power_consumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.string="?")
# subseting the dates requested (2007-02-01 to 2007-02-02)
power_subset <- subset(power_consumption, Date=="1/2/2007" | Date=="2/2/2007")
power_subset$date_var <- as.Date(power_subset$Date, "%d/%m/%Y")
power_subset$day <- weekdays(power_subset$date_var)
head(power_subset)

# creating plots (plot 4)

par(mfrow=c(2,2))

# panel 1,1
plot(power_subset$Global_active_power, type="l", xaxt='n', xlab='', ylab='Global Active Power')
axis(1,at=c(1,24*60,2*24*60) ,c("Thu", "Fri", "Sat"))

# panel 1,2
plot(power_subset$Voltage, type='l', xaxt='n', xlab='datetime', ylab='Voltage')
axis(1, at=c(1,24*60,2*24*60), c("Thu", "Fri", "Sat"))

# panel 2,1
plot(power_subset$Sub_metering_1, type="n", xaxt='n', xlab='', ylab='Energy sub metering')
points(power_subset$Sub_metering_1, col="black", type="l")
points(power_subset$Sub_metering_2, col="red", type="l")
points(power_subset$Sub_metering_3, col="blue", type="l")
axis(1,at=c(1,24*60,2*24*60) ,c("Thu", "Fri", "Sat"))
legend(800, 40, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1), bty='n', y.intersp=0.4, cex=0.7)

# panel 2,2
plot(power_subset$Global_reactive_power, type='l', xlab='datetime', xaxt='n', ylab='Global_reactive_power')
axis(1, at=c(1,24*60,2*24*60), c("Thu", "Fri", "Sat"))

# save as PNG file
dev.copy(png, filename="plot4.png")
dev.off()

