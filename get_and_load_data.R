Sys.setlocale("LC_TIME","en_US.UTF-8")

dataDir <- './data/'
fileName <- "household_power_consumption.txt"

# Download and unzip data set
if(!file.exists(paste0(dataDir, fileName))) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    zipFileName <- "household_power_consumption.zip"
    
    if(!file.exists(dataDir)) {dir.create(dataDir)}
    
    download.file(fileUrl, destfile = paste0(dataDir, zipFileName), method = 'curl') 
    unzip(zipfile =  paste0(dataDir, zipFileName), exdir = dataDir, overwrite = T)
}

# Load Household Power Consumption data set
if (!exists('hpc')) {
    
    ## Tip to find the first line of data using shell linux 
    ## $ grep '^1/2/2007;00:00:00' -in household_power_consumption.txt
    begin.of.data <- 66638
    
    ## Tip to find the last line of data using shell linux: 
    ## grep '^2/2/2007;23:59:00' -in household_power_consumption.txt
    end.of.data <- (69517 - begin.of.data + 1)
    
    colNames <- c("Date", "Time", 
                  "Global_active_power", "Global_reactive_power", 
                  "Voltage", "Global_intensity",
                  "Sub_metering_1", "Sub_metering_2",
                  "Sub_metering_3")
    
    colClasses <- c("character", "character", 
                    "numeric", "numeric", 
                    "numeric", "numeric", 
                    "numeric", "numeric", 
                    "numeric")
    
    hpc <- read.table(file = paste0(dataDir, fileName), 
                      na.strings = "?", 
                      sep = ";", 
                      header = F,
                      dec=".",
                      comment.char = "",
                      skip = begin.of.data,
                      nrows = end.of.data, 
                      colClasses = colClasses,
                      col.names = colNames)
    
    hpc$Datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
}