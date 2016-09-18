## Loading the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption_data.zip")
unzip("household_power_consumption_data.zip") 
data <-read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrow = 69517, na.strings="?")
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")
usedata <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
str(usedata)

### Plot 4
png("plot4.png")
par(mfrow=c(2,2),mar= c(5,5,2,2))

with(usedata,plot(DateTime, Global_active_power,type="l",col="black",ylab="Global Active Power",xlab=""))

with(usedata,plot(DateTime,Voltage,type="l",col="black",ylab="Voltage",xlab="datetime"))

with(usedata,plot(DateTime, Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab=""))
with(usedata,lines(DateTime, Sub_metering_2,type="l",col="red"))
with(usedata,lines(DateTime, Sub_metering_3,type="l",col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)

with(usedata,plot(DateTime,Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime"))
dev.off()