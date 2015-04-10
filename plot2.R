setwd("C:/Program Files/R/Coursera/Exploratory Data Analysis 4-2015/Project 1")
df1<-read.table("household_power_consumption.txt", header=T,sep = ";", na.strings="?")#import dataframe
df1$Date <- as.Date(df1$Date, "%d/%m/%Y")#get date in correct format
new1 <- subset(df1, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))#subset desired date range (2007-02-01 and 2007-02-02)
new1$datetime<-as.POSIXct(paste(new1$Date, new1$Time), format="%Y-%m-%d %H:%M:%S")#concatenate Date and  time into one column for use on x axis

#plot2.png
png(file="plot2.png",width=480,height=480)
plot(Global_active_power~datetime,data=new1,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
