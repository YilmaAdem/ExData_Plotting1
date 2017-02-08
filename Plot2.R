## Download and read table
setwd('/Users/powerdata/');
power <- read.table('powerdata.txt', sep=';', header=TRUE,colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),na.strings='?')
## Change Date Column as Date Object
power$Date<-as.Date(power$Date,"%d/%m/%Y")
##subset only data from 1/2/2007 - 2/2/2007
subset <- power[power$Date>="2007-02-01" & power$Date<="2007-02-02",]

# format Time column
subset$Time<-strptime(paste(subset$Date,subset$Time, sep=" "),format="%Y-%m-%d %H:%M:%S")

# create plot
plot(subset$Time,subset$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
#save file as plot2
dev.copy(png, filename = "plot2.png")
dev.off()
