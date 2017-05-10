#Using the base plotting system, make a plot showing the total PM2.5 emission from all 
#sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")

emis_year<- aggregate(NEI$Emissions, list(NEI$year),sum)

png('plot1.png', width=480, height=480)
plot(emis_year, xaxt="n", type="l", 
     main="PM2.5 emisson for each year",
     xlab="Year", ylab="Emission",lwd=2)
axis(1, at = seq(1999, 2008, by = 3))
dev.off()