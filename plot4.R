source('get_and_load_data.R')

png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "white")

par(mfrow = c(2, 2))

plot(hpc$Datetime , hpc$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(hpc$Datetime , hpc$Voltage, 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

with(hpc, plot(Datetime, 
               Sub_metering_1, 
               ylab = "Energy sub metering", 
               xlab = "", 
               type = "l"))

with(hpc, lines(Datetime, 
                Sub_metering_2, 
                col = "red"))

with(hpc, lines(Datetime, 
                Sub_metering_3, 
                col = "blue"))

legend("topright", 
       pch = "_", 
       col = c("black", "red", "blue"), 
       legend = names(hpc)[7:9])

plot(hpc$Datetime , 
     hpc$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab= "Global_reactive_power")

dev.off()