source('get_and_load_data.R')

png(filename = "plot3.png", 
    width = 480, height = 480,
    units = "px", bg = "white")

with(hpc, plot(Datetime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l"))
with(hpc, lines(Datetime, Sub_metering_2, col = "red"))
with(hpc, lines(Datetime, Sub_metering_3, col = "blue"))

legend("topright", pch = "_", col = c("black", "red", "blue"), legend = names(hpc)[7:9])

dev.off()
