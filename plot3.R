library(dplyr)
#Load The File
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
#Filter on "1/2/2007","2/2/2007"
finaldata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
#Create Column DateTime
finaldata <- mutate(finaldata, Date_Time = paste(Date, Time, sep=" ")  )
finaldata$Date_Time  <-strptime(finaldata$Date_Time,"%d/%m/%Y %H:%M:%S")
#Create Plot 1
par(mfrow = c(1, 1))
png("plot3.png", 480, 480)
with(finaldata,plot(Date_Time,Sub_metering_1,type="l", ylab="Energy sub metering"))
with(finaldata,lines(Date_Time,Sub_metering_2,type="l", col="red"))
with(finaldata,lines(Date_Time,Sub_metering_3,type="l", col="blue"))
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty="solid" )
dev.off()
