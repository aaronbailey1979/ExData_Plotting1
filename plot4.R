my_data <- read.table("household_power_consumption.txt",sep=";")
names <- my_data[1,]
colnames(my_data) <- names
new3_data<-my_data[my_data$Date == "2/2/2007" | my_data$Date == "1/2/2007",]

gap <- as.numeric(new3_data$Global_active_power)

mergedtime <- paste(new3_data$Date,new3_data$Time, sep=" ")
usable <- as.POSIXlt(mergedtime,format="%d/%m/%Y %H:%M:%S")
usable <- as.numeric(usable)

Voltage <- as.numeric(new3_data$Voltage)

Global_reactive_power <- as.numeric(new3_data$Global_reactive_power)


Sub_metering_1 <- new3_data[,7]
Sub_metering_2 <- new3_data[,8]
Sub_metering_3 <- new3_data[,9]

# plot stuff

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(usable,gap, xlab = "", ylab="Global Active Power", type ="l",main = "",xaxt = "n")
axis(1, at = c(usable[1],usable[1440],usable[2880]), labels = c("Thu","Fri","Sat"))

plot(usable,Voltage, xlab = "datetime", ylab="Voltage", type ="l",main = "",xaxt = "n")
axis(1, at = c(usable[1],usable[1440],usable[2880]), labels = c("Thu","Fri","Sat"))

plot(usable,Sub_metering_1, xlab = "", ylab="Energy sub metering", type ="l",main = "",xaxt = "n")
lines(usable,Sub_metering_2,col='red')
lines(usable,Sub_metering_3,col='blue')
axis(1, at = c(usable[1],usable[1440],usable[2880]), labels = c("Thu","Fri","Sat"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1), lwd=c(1,1))

plot(usable,Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power", type ="l",main = "",xaxt = "n")
axis(1, at = c(usable[1],usable[1440],usable[2880]), labels = c("Thu","Fri","Sat"))

dev.off()

rm(list=ls())