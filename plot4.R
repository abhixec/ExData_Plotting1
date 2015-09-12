#Author : Abhinav
#Coursera: Exploratory Data Analysis Course

#This script should be run from within the directory where the input file is 
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
#Converts the date column from factor to Date object
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
#subsetting the data to get rows for a particular date range
new_data<-subset(data, Date == "2007-02-01" | Date=="2007-02-02")
#creating a timedate column
new_data$timedate<-as.POSIXlt(paste(new_data$Date,new_data$Time), format="%Y-%m-%d %H:%M:%S")
#Plot
png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
#Plot#1
plot(new_data$timedate,new_data$Global_active_power,xlab="",ylab="Global Active Power",type="l")
#Plot#2
plot(new_data$timedate,new_data$Voltage,xlab="datetime",ylab="Voltage",type="l")
#Plot#3
plot(new_data$time,new_data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
points(new_data$timedate,new_data$Sub_metering_2,col="red",type="l")
points(new_data$timedate,new_data$Sub_metering_3,col="blue",type="l")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n")
#Plot#4
plot(new_data$timedate,new_data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()
