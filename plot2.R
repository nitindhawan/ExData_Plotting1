#Read the data in household power consumption file
data<-read.csv("household_power_consumption.txt", 
                sep=";", colClasses=c("character","character",rep("numeric",7)), 
                na.strings="?", nrows = 2100000);

#limit the data to the two dates in the assignment and convert to datetime
data <-data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
data$Datetime<-strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S");

#Construct plot 2
png("plot2.png", width=480, height=480, bg="transparent");
plot(x=data$Datetime, y=data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="");
dev.off();
