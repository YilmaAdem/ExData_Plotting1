 ## Download and read table
 setwd('/Users\powerdata/');
power <- read.table('powerdata.txt', sep=';', header=TRUE,colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),na.strings='?')
## Change Date Column as Date Object
 power$Date<-as.Date(power$Date,"%d/%m/%Y")
##subset only data from 1/2/2007 - 2/2/2007
  subset <- power[power$Date>="2007-02-01" & power$Date<="2007-02-02",]
# format Time column
 subset$Time<-strptime(paste(subset$Date,subset$Time, sep=" "),format="%Y-%m-%d %H:%M:%S")

# Multiple base plot
par(mfrow=c(2,2))

#Top left plot
  plot(subset$Time,subset$Global_active_power,type="l",ylab="Global Active Power",xlab="")

#Top right plot
  plot(subset$Time,subset$Voltage,type="l",ylab='Voltage',xlab="datetime")

#Bottom left
  plot(subset$Time,subset$Sub_metering_1,type="l",ylab="Engery sub metering",xlab="")
  lines(subset$Time,subset$Sub_metering_2,type="l",col='red')
  lines(subset$Time,subset$Sub_metering_3,type="l",col='blue')
  legend("topright",cex =0.6,bty = 'n',lty = 1,col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Bottom right
  plot(subset$Time,subset$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab="datetime")

#save file
dev.copy(png, filename = "plot4.png")
dev.off()
