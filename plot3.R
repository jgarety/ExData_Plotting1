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
png("plot3.png", width=480, height=480, units="px")
with(keep, plot(DateTime, Sub_metering_1,
                type="l",
                xlab="",
                ylab="Energy sub metering"
                )
)
with(keep, points(DateTime, Sub_metering_2, type="l", col="Red"))
with(keep, points(DateTime, Sub_metering_3, type="l", col="Blue"))
legend("topright", lty=1,
       col=c("Black", "Red", "Blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       )
dev.off()