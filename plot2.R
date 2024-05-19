my_data <- read.table("household_power_consumption.txt",sep=";")
names <- my_data[1,]
colnames(my_data) <- names
new3_data<-my_data[my_data$Date == "2/2/2007" | my_data$Date == "1/2/2007",]
gap <- as.numeric(new3_data$Global_active_power)
mergedtime <- paste(new3_data$Date,new3_data$Time, sep=" ")
usable <- as.POSIXlt(mergedtime,format="%d/%m/%Y %H:%M:%S")
usable <- as.numeric(usable)
png("plot2.png", width=480, height=480)
plot(usable,gap, xlab = "", ylab="Global Active Power (kilowatts)", type ="l",main = "",xaxt = "n")
axis(1, at = c(usable[1],usable[1440],usable[2880]), labels = c("Thu","Fri","Sat"))
dev.off()
rm(list=ls())