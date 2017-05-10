#4. Across the United States, how have emissions from coal combustion-related sources changed
#from 1999–2008?

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_coal<-SCC[SCC$EI.Sector %like% "Coal",]
NEI_SCC_coal <- subset(NEI, NEI$SCC %in% SCC_coal$SCC)
NEI_SCC_coal1 <- aggregate(NEI_SCC_coal[c("Emissions")], list(year = NEI_SCC_coal$year), sum)

png('plot4.png', width=480, height=480)
qplot(year, Emissions, data = NEI_SCC_coal1,
      geom = "line", 
      ylab = "Emission", 
      xlab = "Year", 
      main = "PM2.5 emisson from coal combustion-related sources across the US")
dev.off()