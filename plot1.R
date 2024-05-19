my_data <- read.table("household_power_consumption.txt",sep=";")
names <- my_data[1,]
colnames(my_data) <- names
new_data<-my_data[my_data$Date == "2/2/2007" | my_data$Date == "1/2/2007",]
gap <- as.numeric(new_data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(gap, ylab="Frequency", xlab="Global Active Power (kilowatts)", main="Global Active Power",col='red')
dev.off()
rm(list=ls())