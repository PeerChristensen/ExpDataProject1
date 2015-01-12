
setwd("/Users/ling-pcr/Desktop/Data")

#read data
file<-"household_power_consumption.txt"
all_data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE)

#subset data
data<-all_data[all_data$Date %in% c("1/2/2007","2/2/2007"),]

#plot
png("plot1.png", width=480, height=480)
hist(as.numeric(data$Global_active_power), 
     col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()