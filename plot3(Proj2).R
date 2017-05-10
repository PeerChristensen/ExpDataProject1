#3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make
#a plot answer this question.

library(ggplot2)
library(plyr)

NEI <- readRDS("summarySCC_PM25.rds")

NEI_balt<- NEI[NEI$fips=="24510",]
df_NEI_balt <- ddply(NEI_balt, .(type, year), summarize, Emissions = sum(Emissions))
colnames(df_NEI_balt)<-c("Type", "Year", "Emission")
df_NEI_balt<-df_NEI_balt[with(df_NEI_balt, order(Year)),]

png('plot3.png', width=480, height=480)
qplot(Year, Emission, data = df_NEI_balt,
      col= Type,
      geom = "line", 
      ylab = "Emission", 
      xlab = "Year", 
      main = "PM2.5 emisson for each year in Baltimore")
dev.off()