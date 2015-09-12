#Author : Abhinav
#Coursera: Exploratory Data Analysis Course

#This script should be run from within the directory where the input file is 
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
#Converts the date column from factor to Date object
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
#subsetting the data to get rows for a particular date range
new_data<-subset(data, Date == "2007-02-01" | Date=="2007-02-02")
#nrow(new_data)
#creating a timedate column
new_data$timedate<-as.POSIXlt(paste(new_data$Date,new_data$Time), format="%Y-%m-%d %H:%M:%S")
#new_data$timedate
#Plot
png(filename="plot2.png", width=480, height=480, units="px")
plot(new_data$timedate,new_data$Global_active_power,type="l",xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()
