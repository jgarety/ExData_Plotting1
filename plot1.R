sourceUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(sourceUrl, "householdpower.zip",mode="wb")
unzip("householdpower.zip")
data <- read.csv("household_power_consumption.txt",
                 sep=";",
                 na.strings=c("?"),
                 stringsAsFactors=FALSE
                 )
keep <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
png("plot1.png", width=480, height=480, units="px")
with(keep, hist(Global_active_power, 
                main="Global Active Power",
                xlab="Global Active Power (kilowatts)",
                col="Red", 
                ylim=c(0,1200))
     )
dev.off()