sourceUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(sourceUrl, "householdpower.zip",mode="wb")
unzip("householdpower.zip")
data <- read.csv("household_power_consumption.txt",
                 sep=";",
                 na.strings=c("?"),
                 stringsAsFactors=FALSE
)
keep <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
keep$DateTime <- strptime(paste(keep$Date,keep$Time), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480, units="px")
# set 2 by 2 plots
par(mfrow=c(2,2))
# first plot
with(keep, plot(DateTime, Global_active_power, 
                type="l", 
                xlab="", 
                ylab="Global Active Power"
                )
)
# second plot
with(keep, plot(DateTime, Voltage, 
                type="l",
                xlab="datetime"
                )
)
# third plot
with(keep, plot(DateTime, Sub_metering_1,
                type="l",
                xlab="",
                ylab="Energy sub metering"
                )
)
with(keep, points(DateTime, Sub_metering_2, type="l", col="Red"))
with(keep, points(DateTime, Sub_metering_3, type="l", col="Blue"))
legend("topright", lty=1, bty="n",
       col=c("Black", "Red", "Blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)
# fourth plot
with(keep, plot(DateTime, Global_reactive_power, 
                type="l",
                xlab="datetime",
                ylim=c(0.0,0.5)
                )
)
# reset to one plot
par(mfrow=c(1,1))
dev.off()