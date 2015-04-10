setwd("C:/Program Files/R/Coursera/Exploratory Data Analysis 4-2015/Project 1")
df1<-read.table("household_power_consumption.txt", header=T,sep = ";", na.strings="?")#import dataframe
df1$Date <- as.Date(df1$Date, "%d/%m/%Y")#get date in correct format
new1 <- subset(df1, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))#subset desired date range (2007-02-01 and 2007-02-02)

#plot1.png
png(file="plot1.png",width=480,height=480)
hist(new1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
