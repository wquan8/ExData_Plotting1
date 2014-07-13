## plot1 for cleaning data course/project1
library(data.table)
#for linux
#setwd("/home/wquan/classes/exploratoryDataAnalysis/proj1")
## for mac
setwd("/Users/quan6530/classes/exploratoryDataAnalysis/proj1")

plot1 <- function ()
{
  powerData <- fread("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
  
  pwData <- rbind(powerData[with(powerData, Date == '1/2/2007'),], powerData[with(powerData, Date == '2/2/2007'),])  
  
  
  hist(as.numeric(pwData$Global_active_power),xlab="Globa Active Power(kilowatts)",main="Global Active Power",col="red")
  
  png(filename="plot1.png",width=480, height=480, units="px")
  hist(as.numeric(pwData$Global_active_power),xlab="Globa Active Power(kilowatts)",main="Global Active Power",col="red")
  dev.off()
  
}