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
png("plot2.png", 480, 480)
plot(finaldata$Date_Time, finaldata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
