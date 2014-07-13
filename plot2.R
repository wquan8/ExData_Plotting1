## plot1 for cleaning data course/project1
library(data.table)
#for linux
#setwd("/home/wquan/classes/exploratoryDataAnalysis/proj1")
## for mac
setwd("/Users/quan6530/classes/exploratoryDataAnalysis/proj1")

plot2 <- function ()
{
        powerData <- fread("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
        
        pwData <- rbind(powerData[with(powerData, Date == '1/2/2007'),], powerData[with(powerData, Date == '2/2/2007'),])  
        
        pwData[, Global_active_power := as.numeric(Global_active_power)]
        pwData[, DateTime := paste(Date, Time, sep=" ")]
        pwData[, cDateTime := as.POSIXct(strptime(DateTime, format='%d/%m/%Y %H:%M:%S', tz='GMT'))]
        
        with(pwData, plot(cDateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
        
        png(filename="plot2.png",width=480, height=480, units="px")
        with(pwData, plot(cDateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
        dev.off()
        
}

plot2()