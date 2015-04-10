setwd("C:/Program Files/R/Coursera/Exploratory Data Analysis 4-2015/Project 1")
df1<-read.table("household_power_consumption.txt", header=T,sep = ";", na.strings="?")#import dataframe
df1$Date <- as.Date(df1$Date, "%d/%m/%Y")#get date in correct format
new1 <- subset(df1, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))#subset desired date range (2007-02-01 and 2007-02-02)
new1$datetime<-as.POSIXct(paste(new1$Date, new1$Time), format="%Y-%m-%d %H:%M:%S")#concatenate Date and  time into one column for use on x axis

#plot4.png
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(Global_active_power~datetime,data=new1,type="l",ylab="Global Active Power",xlab="")#topleft

plot(Voltage~datetime,data=new1,type="l",ylab="Voltage",xlab="datetime")#topright

plot(Sub_metering_1~datetime,data=new1,type="l",ylab="Energy sub metering",xlab="")#bottomright
lines(Sub_metering_2~datetime,data=new1,type="l",col="red")
lines(Sub_metering_3~datetime,data=new1,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),lty=1,bty="n")

plot(Global_reactive_power~datetime,data=new1,type="l",ylab="Global_reactive_power",xlab="datetime")#bottomright

dev.off()
