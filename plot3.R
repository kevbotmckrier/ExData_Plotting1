source("readPowerData.R")

powerData.df <- readPowerData()

png(filename = "plot3.png",width = 480, height = 480)

#find range
yrange = range(powerData.df$Sub_metering_1,powerData.df$Sub_metering_2,powerData.df$Sub_metering_3)
xrange = range(powerData.df$DateTime)

#setup plot
plot(xrange,yrange,type = "n",ylab="Energy sub metering",xlab="")

#add a line for each sub meter
with(powerData.df,lines(DateTime,Sub_metering_1))
with(powerData.df,lines(DateTime,Sub_metering_2,col="red"))
with(powerData.df,lines(DateTime,Sub_metering_3,col="blue"))

legend(x="topright",legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

dev.off()