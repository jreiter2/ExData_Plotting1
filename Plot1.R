# Exploratory Data Analysis Project 1, plot 1

# Import data from file
power_consumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.string="?")
# subseting the dates requested (2007-02-01 to 2007-02-02)
power_subset <- subset(power_consumption, Date=="1/2/2007" | Date=="2/2/2007")
head(power_subset)

# creating histogram (plot 1)
hist(as.numeric(power_subset$Global_active_power), col="red", xlab="Global Active Power (kilowatts", main="Global Active Power")

# save as PNG file
dev.copy(png, filename="plot1.png")
dev.off()
