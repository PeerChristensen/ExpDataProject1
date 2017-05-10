#2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")

NEI_balt<- NEI[NEI$fips=="24510",]
emis_balt= aggregate(NEI_balt$Emissions, list(NEI_balt$year),sum)

png('plot2.png', width=480, height=480)
plot(emis_balt, xaxt="n", type="l", 
     main="PM2.5 emisson for each year in Baltimore",
     xlab="Year", ylab="Emission",lwd=2)
axis(1, at = seq(1999, 2008, by = 3))
dev.off()