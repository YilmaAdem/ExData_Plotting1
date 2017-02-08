## Download and read table
setwd('/Users/powerdata/');
power <- read.table('powerdata.txt', sep=';', header=TRUE,colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),na.strings='?')
## Change Date Column as Date Object
power$Date<-as.Date(power$Date,"%d/%m/%Y")
##subset only data from 1/2/2007 - 2/2/2007
subset <- power[power$Date>="2007-02-01" & power$Date<="2007-02-02",]

## plot 1 with hist()
hist(subset$Global_active_power, main="Global Active Power", col = "red", xlab= "Global Acrive Power (kilowatts)")
## save it as PNG
dev.copy(png, filename = "plot1.png")
dev.off()
