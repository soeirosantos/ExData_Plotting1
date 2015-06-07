source('get_and_load_data.R')

png(filename = "plot1.png", 
    width = 480, height = 480,
    units = "px", bg = "white")

hist(hpc$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     main ="Global Active Power",
     col="red")

dev.off()
