## Assuming that the dataset is in the current working directory
## the dataset is loaded into R by using "read.table()"
newdat <- read.table("./household_power_consumption.txt",header = TRUE, sep =";",na.strings="?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric"))
## a new column is added to the datasetwhich will have the dates in "yyyy-mm-dd" format
newdat$formattedtime <- format(as.Date(newdat$Date, "%d/%m/%Y"), "%Y-%m-%d")
## subset of the dataset with the mentioned dates is created
subdat <- newdat[newdat$formattedtime == "2007-02-01" | newdat$formattedtime == "2007-02-02",][,]
## minimum of the time series of the date time is calculated to mark the first 
## tick ("Thu" label) in X axis of the plot
st <- min(time(subdat$formattedtime))
## maximum of the time series of the date time is calculated to mark the third 
## tick ("Sat" label) in X axis of the plot
mt <- max(time(subdat$formattedtime))
## midpoint of the time series of the date time is calculated to mark the second
## tick ("Fri" label) in X axis of the plot 
md <- (mt - st)/2
## Graphic device file is initiated
png(filename = "plot2.png",width=480, height=480, units="px")
## plot is generated
with(subdat, plot(time(formattedtime),Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)", xaxt = "n"))
## X axis ticks and labels are defined
axis(1, at = c(st,md,mt), labels = c("Thu", "Fri", "Sat"))
## Graphic device file is closed
dev.off()
