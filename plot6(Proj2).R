#6.Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
#vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater 
#changes over time in motor vehicle emissions?

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_vehi<-SCC[SCC$EI.Sector %like% "Vehicle",]
vehi_BC_LA <- subset(NEI, NEI$SCC %in% SCC_vehi$SCC)
vehi_BC_LA1 <- vehi_BC_LA[vehi_BC_LA$fips=="24510" | vehi_BC_LA$fips== "06037",]
vehi_BC_LA2<- data.frame(vehi_BC_LA1$fips,vehi_BC_LA1$Emissions,vehi_BC_LA1$year)
names(vehi_BC_LA2) <- c("fips","Emissions","year")
levels(vehi_BC_LA2$fips) <- c("LA County", "Baltimore C")
vehi_BC_LA3 <- aggregate(vehi_BC_LA2[c("Emissions")], list(fips=vehi_BC_LA2$fips, year = vehi_BC_LA2$year), sum)

png('plot6.png', width=480, height=480)
qplot(year, Emissions, data = vehi_BC_LA3,
      col = fips,
      geom = "line", 
      ylab = "Emission", 
      xlab = "Year",
      main = "PM2.5 emisson from motor vehicle sources in Baltimore City and Los Angeles County")
dev.off()