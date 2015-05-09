# Reading headers from the source file

df<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=1)
df_names<-names(df)

# Reading data from the source file - only for dates 2/1/2007 and 2/2/2007

df<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",skip=66636,nrows=2880)
names(df)<-df_names

# Converting columns Date and Time from "Factor" to the appropriate format

df$Date<-as.Date(df$Date,format="%d/%m/%Y")
df$Time<-strptime(paste(df$Date, df$Time, sep=" "),format="%Y-%m-%d %T")

# Creating four plots together

png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
# -------------------- Plot #1 --------------------------------------------------
plot(df$Time,df$Global_active_power,main="",ylab="Global Active Power",xlab="",type="n")
lines(df$Time,df$Global_active_power)

# -------------------- Plot #2 --------------------------------------------------
plot(df$Time,df$Voltage,main="",ylab="Voltage",xlab="datetime",type="n")
lines(df$Time,df$Voltage)

# -------------------- Plot #3 --------------------------------------------------
plot(df$Time,df$Sub_metering_1,main="",ylab="Energy sub metering",xlab="",type="n")
lines(df$Time,df$Sub_metering_1, col="Black")
lines(df$Time,df$Sub_metering_2, col="Red")
lines(df$Time,df$Sub_metering_3, col="Blue")
legend("topright",lwd=2,bty="n",col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# -------------------- Plot #4 --------------------------------------------------
plot(df$Time,df$Global_reactive_power,main="",ylab="Global_reactive_power",xlab="datetime",type="n")
lines(df$Time,df$Global_reactive_power)

# Saving the plot into a .png file

dev.off()