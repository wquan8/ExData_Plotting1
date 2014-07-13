## plot1 for cleaning data course/project1
library(data.table)
#for linux
#setwd("/home/wquan/classes/exploratoryDataAnalysis/proj1")
## for mac
setwd("/Users/quan6530/classes/exploratoryDataAnalysis/proj1")

plot3 <- function ()
{
        powerData <- fread("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
        
        pwData <- rbind(powerData[with(powerData, Date == '1/2/2007'),], powerData[with(powerData, Date == '2/2/2007'),])  
        
        pwData[, Global_active_power := as.numeric(Global_active_power)]
        pwData[, Sub_metering_1 := as.numeric(Sub_metering_1)]
        pwData[, Sub_metering_2 := as.numeric(Sub_metering_2)]
        pwData[, Sub_metering_3 := as.numeric(Sub_metering_3)]
        
        pwData[, DateTime := paste(Date, Time, sep=" ")]
        pwData[, cDateTime := as.POSIXct(strptime(DateTime, format='%d/%m/%Y %H:%M:%S', tz='GMT'))]
        
        with(pwData, plot(Sub_metering_1 ~ cDateTime, type="l", xlab="", ylab="Energy sub metering"), )
        with(pwData, points(Sub_metering_2 ~ cDateTime, type="l", col="red"))
        with(pwData, points(cDateTime, Sub_metering_3, type="l", col="blue"))
        legend("topright", col=c("black","red","blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        png(filename="plot3.png",width=480, height=480, units="px")
        with(pwData, plot(Sub_metering_1 ~ cDateTime, type="l", xlab="", ylab="Energy sub metering"), )
        with(pwData, points(Sub_metering_2 ~ cDateTime, type="l", col="red"))
        with(pwData, points(cDateTime, Sub_metering_3, type="l", col="blue"))
        legend("topright", col=c("black","red","blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
        
}

plot3()