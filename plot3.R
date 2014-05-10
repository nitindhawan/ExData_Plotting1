#Read the data in household power consumption file
data<-read.csv("household_power_consumption.txt", 
                sep=";", colClasses=c("character","character",rep("numeric",7)), 
                na.strings="?", nrows = 2100000);

#limit the data to the two dates in the assignment and convert to datetime
data <-data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
data$Datetime<-strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S");

#Construct plot 3

#First compute the range of the plot 3
submeterClasses <-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3");
xrange <- range(data$Datetime);
yrange <- range(data[, submeterClasses]);

#open a blank plot
png("plot3.png", width=480, height=480, bg="transparent");
plot(x=xrange, y=yrange, type="n", ylab="Energy sub metering", xlab="");

#add three lines
lines(x=data$Datetime, y=data$Sub_metering_1);
lines(x=data$Datetime, y=data$Sub_metering_2, col="red");
lines(x=data$Datetime, y=data$Sub_metering_3, col="blue");

#add legend on top right
legend("topright",submeterClasses, lty=c(1,1,1), col=c("black", "red", "blue"));
dev.off();