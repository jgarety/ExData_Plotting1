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
png("plot2.png", width=480, height=480, units="px")
with(keep, plot(DateTime, Global_active_power,
                type="l",
                xlab="",
                ylab="Global Active Power (kilowatts)"
                )
     )
dev.off()