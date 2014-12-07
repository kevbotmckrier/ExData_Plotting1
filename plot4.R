source("readPowerData.R")

powerData.df = readPowerData()

png(filename = "plot4.png",width = 480, height = 480)

#set rows/cols in plot
par(mfrow=c(2,2))

#create frist plot
with(powerData.df,plot(DateTime,Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)"))

#create second plot
with(powerData.df,plot(DateTime,Voltage, type="l", xlab = "", ylab="Voltage"))

#create the third plot
yrange = range(powerData.df$Sub_metering_1,powerData.df$Sub_metering_2,powerData.df$Sub_metering_3)
xrange = range(powerData.df$DateTime)

plot(xrange,yrange,type = "n",ylab="Energy sub metering",xlab="")

with(powerData.df,lines(DateTime,Sub_metering_1))
with(powerData.df,lines(DateTime,Sub_metering_2,col="red"))
with(powerData.df,lines(DateTime,Sub_metering_3,col="blue"))

legend(x="topright",legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

#create the fourth plot
with(powerData.df,plot(DateTime,Global_reactive_power, type="l", xlab = ""))

dev.off()