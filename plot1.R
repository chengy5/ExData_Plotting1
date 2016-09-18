## Loading the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption_data.zip")
unzip("household_power_consumption_data.zip") 
data <-read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrow = 69517, na.strings="?")
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")
usedata <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
str(usedata)

### Plot 1
png("plot1.png")
hist(usedata$Global_active_power, col ="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()