# plot2.R
# This code downloads the dataset from the url, unzip it and create the plot2
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

# STEP 2: Create plot with lines, adjust y-label
png(filename = "plot2.png")
with(data, plot(datetime, Global_active_power, typ = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

# STEP 3: Saving png file. Default is 480x480
dev.off()
