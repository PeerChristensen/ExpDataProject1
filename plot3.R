
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

#png
png("plot3.png", width=480, height=480)

#plot
plot(time,sm1, type="l")
lines(time, sm2, type="l",col="red")
lines(time, sm3, type="l",col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1, col=c("black","red","blue"))

dev.off()