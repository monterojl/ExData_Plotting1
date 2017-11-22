# plot4.R
# This code downloads the dataset from the url, unzip it and create the plot4
# as described in the Exploratory Data Analysis Course Project 1

# STEP 0:Downloading data file from url -- UNCOMMENT FOR THE FIRST RUN
#fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileUrl,destfile="data.zip")

# Unzip data file directory
#unzip(zipfile="./data.zip")


# STEP 1: Importing only rows involved in exercise, using lubridate to creae proper dates
require(lubridate)

Sys.setlocale("LC_TIME", "English") # Setting English locale to match required plot weekdays

data<-read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
colnames(data)<-c("Date",	"Time",	"Global_active_power",	"Global_reactive_power",	"Voltage",	
                  "Global_intensity",	"Sub_metering_1",	"Sub_metering_2",	"Sub_metering_3")


data$datetime<-paste(data$Date, data$Time, sep= " ") # merging dates and times
data$datetime<- dmy_hms(data$datetime) # Coverting to date/time class

# STEP 2: Create 4 graphs in a 2x2 plot with type lines, adjust labels
png(filename = "plot4.png")
par(mfrow=c(2,2))

# Graph 1:
with(data, plot(datetime, Global_active_power, typ = "l", ylab = "Global Active Power", xlab = ""))

# Graph 2: 
with(data, plot(datetime, Voltage, typ = "l", ylab = "Voltage"))

# Graph 3: Energy Sub metering
with(data, plot(datetime, Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = ""))
# Adding to plot  Sub_metering_2 and Sub_metering_3
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
# Adding legend
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                  bty="n") # Legend with lines and no box

# Graph4: Global reactive power graph
with(data, plot(datetime, Global_reactive_power, typ = "l"))

# STEP 3: saving png file. Default is 480x480
dev.off()

