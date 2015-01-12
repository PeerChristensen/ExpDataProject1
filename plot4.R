
setwd("/Users/ling-pcr/Desktop/Data")

#read data
file<-"household_power_consumption.txt"
all_data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE)

#subset data
data<-all_data[all_data$Date %in% c("1/2/2007","2/2/2007"),]

#variables
time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sm1 <- as.numeric(data$Sub_metering_1)
sm2 <- as.numeric(data$Sub_metering_2)
sm3 <- as.numeric(data$Sub_metering_3)

#plotting
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#1
plot(time,as.numeric(data$Global_active_power), type="l",
     xlab="",
     ylab="Global Active Power")
#2
plot(time,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
#3
plot(time,sm1, type="l",ylab="Energy sub metering", xlab=" ")
lines(time, sm2, type="l",col="red")
lines(time, sm3, type="l",col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1, col=c("black","red","blue"),bty="n")
#4
plot(time,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()