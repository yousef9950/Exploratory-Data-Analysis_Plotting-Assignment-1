## Getting full dataset
ig <- read.csv("./exp-data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
ig$Date <- as.Date(ig$Date, format="%d/%m/%Y")

## Subsetting the data
meow <- subset(ig, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(ig)

## Converting dates
hello_ig <- paste(as.Date(meow$Date), meow$Time)
meow$Datetime <- as.POSIXct(hello_ig)

## Plot 2
plot(meow$Global_active_power~meow$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="./exp-data/ExData_Plotting1/project/plot2.png", height=480, width=480)
dev.off()
