# Exploratory Data Analysis Project 1, plot 2

# Import data from file
power_consumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.string="?")
# subseting the dates requested (2007-02-01 to 2007-02-02)
power_subset <- subset(power_consumption, Date=="1/2/2007" | Date=="2/2/2007")
power_subset$date_var <- as.Date(power_subset$Date, "%d/%m/%Y")
power_subset$day <- weekdays(power_subset$date_var)
head(power_subset)

# creating plot (plot 2)
plot(power_subset$Global_active_power, type="l", xaxt='n', xlab='', ylab='Global Active Power (kilowatts)')
axis(1,at=c(1,24*60,2*24*60) ,c("Thu", "Fri", "Sat"))


# save as PNG file
dev.copy(png, filename="plot2.png")
dev.off()
