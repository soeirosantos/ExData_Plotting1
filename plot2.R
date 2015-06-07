source('get_and_load_data.R')

png(filename = "plot2.png", 
    width = 480, height = 480,
    units = "px", bg = "white")

plot(hpc$Datetime , hpc$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()