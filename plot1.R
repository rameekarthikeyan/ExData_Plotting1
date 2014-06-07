## Assuming that the dataset is in the current working directory
## reading the text file using read.table()
newdat <- read.table("./household_power_consumption.txt",header = TRUE, sep =";",na.strings="?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric"))
## subsetting the table for the mentioned two days
newdat$formattedtime <- format(as.Date(newdat$Date, "%d/%m/%Y"), "%Y-%m-%d")
subdat <- newdat[newdat$formattedtime == "2007-02-01" | newdat$formattedtime == "2007-02-02",][,]
## graphic device file is initiated
png(filename = "plot1.png",width=480, height=480, units="px")
## histogram plot is generated
hist(subdat$Global_active_power,col = "Red", xlab = "Global Active Power (kilowatts)", main = "Global Active power")
## graphic device file is closed
dev.off()
