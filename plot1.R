# plot1.R
# This code downloads the dataset from the url, unzip it and create the plot1
# as described in the Exploratory Data Analysis Course Project 1

# STEP 0:Downloading data file from url -- UNCOMMENT FOR THE FIRST RUN
#fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileUrl,destfile="data.zip")

# Unzip data file directory
#unzip(zipfile="./data.zip")

# STEP 1: Importing only rows involved in exercise
data<-read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
colnames(data)<-c("Date",	"Time",	"Global_active_power",	"Global_reactive_power",	"Voltage",	
                  "Global_intensity",	"Sub_metering_1",	"Sub_metering_2",	"Sub_metering_3")

# STEP 2: Create histogram in red, adjust title and x-label
png(filename = "plot1.png")
with(data, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
title("Global Active Power")
# STEP 3: Saving png file. Default is 480x480
dev.off()