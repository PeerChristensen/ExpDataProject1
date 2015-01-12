
setwd("/Users/ling-pcr/Desktop/Data")

#read data
file<-"household_power_consumption.txt"
all_data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE)

#subset data
data<-all_data[all_data$Date %in% c("1/2/2007","2/2/2007"),]

#date and time
time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot
png("plot2.png", width=480, height=480)
plot(time,as.numeric(data$Global_active_power), type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()