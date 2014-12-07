readPowerData <- function() {
  
  #read
  rawData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,colClasses = "character",stringsAsFactors = FALSE)
  
  powerData.df <- rawData
  
  #subset to dates of interest
  powerData.df <- powerData.df[powerData.df$Date == "1/2/2007" | powerData.df$Date == "2/2/2007",]
  
  #create datetime column and format it
  powerData.df$DateTime <- paste(powerData.df$Date,powerData.df$Time)
  powerData.df$DateTime <- strptime(powerData.df$DateTime,format="%d/%m/%Y %H:%M:%S")  
  
  #format appropriate columns to numeric
  for(i in 3:9) {powerData.df[,i] <- as.numeric(powerData.df[,i])}
  
  powerData.df
    

}
  