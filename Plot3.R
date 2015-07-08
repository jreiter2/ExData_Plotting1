# Exploratory Data Analysis Project 1, plot 3

# Import data from file
power_consumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.string="?")
# subseting the dates requested (2007-02-01 to 2007-02-02)
power_subset <- subset(power_consumption, Date=="1/2/2007" | Date=="2/2/2007")
power_subset$date_var <- as.Date(power_subset$Date, "%d/%m/%Y")
power_subset$day <- weekdays(power_subset$date_var)
head(power_subset)

# creating plot (plot 3)
plot(power_subset$Sub_metering_1, type="n", xaxt='n', xlab='', ylab='Energy sub metering')
points(power_subset$Sub_metering_1, col="black", type="l")
points(power_subset$Sub_metering_2, col="red", type="l")
points(power_subset$Sub_metering_3, col="blue", type="l")
axis(1,at=c(1,24*60,2*24*60) ,c("Thu", "Fri", "Sat"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))

# save as PNG file
dev.copy(png, filename="plot3.png")
dev.off()

