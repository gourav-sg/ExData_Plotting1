## platform       x86_64-apple-darwin10.8.0   
## os             darwin10.8.0, Apple MacOS X 10.9.4
## version.string R version 3.1.1 (2014-07-10)
## comments as per the style guide of R from google: https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml

## The R script is used for creating the first graph in R whose details are mentioned in the web page 
## https://github.com/gourav-sg/ExData_Plotting1

## Downloading source file from the internet in case not existing

## creating the target directory for downloading the source file in case not already available


if(!file.exists("./data")) {
  dir.create("./data")
}

## downloading in the file in case not already downloaded
## for the first time this code block will not make any sense, but this just ensures that for
## subsequent multiple runs of the same R script the file is not downloaded again
if(!file.exists("./data/household_power_consumption.zip")) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, destfile = "./data/household_power_consumption.zip", method ="curl")
  setwd("./data")
  system(command = "unzip household_power_consumption.zip")
  setwd("./../")
}

## checking the file contents in the data folder
list.files("./data/")

## loading the file and
## checking the first few lines of the file
t <- read.delim(file = "./data//household_power_consumption.txt", header = TRUE, sep = ";" )
head(t)
View(head(t))

## transforming the Date column to Date type
t$Date <- as.Date(t$Date, format = "%d/%m/%Y")
class(t$Date)
View(t$Date)

## transforming to number 
class(t$Global_active_power)
t$Global_active_power <- as.numeric(as.character(t$Global_active_power))
head(t$Global_active_power)
class(t$Global_active_power)


## creating subset of the required data
t <- subset(t, t$Date >= as.Date("2007-02-01", format = "%Y-%m-%d"))
t <- subset(t, t$Date <= as.Date("2007-02-02", format = "%Y-%m-%d"))


## creating the graph
png(filename = "./data/plot1.png", width = 480, height = 480, units = "px")
hist(t$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()
