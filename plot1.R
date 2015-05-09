# Reading headers from the source file

df<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=1)
df_names<-names(df)

# Reading data from the source file - only for dates 2/1/2007 and 2/2/2007

df<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",skip=66636, nrows=2880)
names(df)<-df_names

# Converting columns Date and Time from "Factor" to the appropriate format

df$Date<-as.Date(df$Date,format="%d/%m/%Y")
df$Time<-strptime(paste(df$Date, df$Time, sep=" "),format="%Y-%m-%d %T")

# Creating the histogram

png(file="plot1.png",width=480,height=480)
par(mfrow=c(1,1))
hist(df$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylim=c(0,1200))

# Saving the plot into a .png file

dev.off()