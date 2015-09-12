#Author : Abhinav
#Coursera: Exploratory Data Analysis Course

#This script should be run from within the directory where the input file is 
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
#Converts the date column from factor to Date object
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
#subsetting the data to get rows for a particular date range
new_data<-subset(data, Date == "2007-02-01" | Date=="2007-02-02")
#nrow(new_data)
#Plotting and outputing to png file
png(filename="plot1.png", width=480, height=480, units="px")
hist(as.numeric(new_data$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
