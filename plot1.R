# Reading dataset ==========================================================================
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="./Exploratory Data Analysis/Project1/household_power_consumption.zip",method="curl")
hh <- read.table(unz("./Exploratory Data Analysis/Project1/household_power_consumption.zip","household_power_consumption.txt"),header=TRUE,sep=";")

# Cleaning dataset ==========================================================================
hh$Date <- as.Date(as.character(hh$Date),"%d/%m/%Y")
hh[which(as.character(hh$Global_active_power)=="?"),"Global_active_power"] <- NA
hh$Global_active_power <- as.numeric(as.character(hh$Global_active_power))
hh[which(as.character(hh$Global_reactive_power)=="?"),"Global_reactive_power"] <- NA
hh$Global_reactive_power <- as.numeric(as.character(hh$Global_reactive_power))
hh[which(as.character(hh$Voltage)=="?"),"Voltage"] <- NA
hh$Voltage <- as.numeric(as.character(hh$Voltage))
hh[which(as.character(hh$Sub_metering_1)=="?"),"Sub_metering_1"] <- NA
hh$Sub_metering_1 <- as.numeric(as.character(hh$Sub_metering_1))
hh[which(as.character(hh$Sub_metering_2)=="?"),"Sub_metering_2"] <- NA
hh$Sub_metering_2 <- as.numeric(as.character(hh$Sub_metering_2))
hh[which(as.character(hh$Sub_metering_3)=="?"),"Sub_metering_3"] <- NA
hh$Sub_metering_3 <- as.numeric(as.character(hh$Sub_metering_3))

# Subsetting dataset =======================================================================
hh <- hh[which(hh$Date=="2007-02-01"|hh$Date=="2007-02-02"),]

# plot1.png =======================================================================
png(filename="./Exploratory Data Analysis/Project1/plot1.png")
hist(hh$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()