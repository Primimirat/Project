# Plot 4
par(mfrow=c(2,2))
with(dat7,{
    hist(dat7$Global_active_power,col="red", main=NULL,
         xlab = "Global Active Power (kilowatts)")
    plot(x = dat7$NewDateTime, y = dat7$Voltage, 
         type = "l",
         ylab = "Voltage",
         xlab = "datetime")
    with(dat7, plot(NewDateTime, Sub_metering_1, type = "l",
                    xlab = "",
                    ylab = "Energy sub metering",
                    col = "black",
                    bg = "white",
                    ylim = c(0,38)))
    with(dat7, lines(NewDateTime, Sub_metering_2, type = "l", col = "red"))
    with(dat7, lines(NewDateTime, Sub_metering_3, type = "l", col = "blue"))
    legend("topright", c("Sub_metering_1", "Sub_metering_1", "Sub_metering_1"), 
           lty = c(1,1,1), col = c("black", "red", "blue"))
    plot(x = dat7$NewDateTime, y = dat7$Global_reactive_power, 
         type = "l",
         ylab = "Global_reactive_power",
         xlab = "datetime")
    
})