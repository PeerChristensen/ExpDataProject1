#5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_vehi<-SCC[SCC$EI.Sector %like% "Vehicle",]
NEI_SCC_vehi <- subset(NEI, NEI$SCC %in% SCC_vehi$SCC)
NEI_SCC_vehi1 <- NEI_SCC_vehi[NEI_SCC_vehi$fips=="24510",]
NEI_SCC_vehi2 <- aggregate(NEI_SCC_vehi1[c("Emissions")], list(year = NEI_SCC_vehi1$year), sum)

png('plot5.png', width=480, height=480)
qplot(year, Emissions, data = NEI_SCC_vehi2,
      geom = "line", 
      ylab = "Emission", 
      xlab = "Year", 
      main = "PM2.5 emisson from motor vehicle sources in Baltimore City")
dev.off()
