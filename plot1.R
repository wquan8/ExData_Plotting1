## plot1 for cleaning data course/project1
library(data.table)
setwd("/home/wquan/classes/exploratoryDataAnalysis/proj1")

plot1 <- function ()
{
  powerData <- fread("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
  
  pwData <- rbind(powerData[with(powerData, Date == '16/12/2006'),], powerData[with(powerData, Date == '17/12/2006'),])  
  
  hist(as.numeric(pwData$Global_active_power),xlab="Globa Active Power(kilowatts)",main="Global Active Power",col="red")
  
}