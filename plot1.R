# With Data Downloaded we can open the environment and the data will be available.
load("C:/Users/.../Coursera - Exploratory Analysis/project1/environment_data.RData")
# Creem nova variable per assegurar que no modifiquem la original
dat = data
# Rough estimate of memory size. It's roughly 84Mb, fine.
object.size(data)
# Confirmem que es un DF i veiem quina classe de variables tenim. Masses factors i la data en format no estandard. 
str(dat)
# We will only need data from 2007. Let's split day month and year from dat$Date.
YMD = t(as.data.frame(strsplit(as.character(dat$Date), split="/",fixed=T)))
colnames(YMD)=c("day","month","year")
Year = YMD[,"year"]
Month = YMD[,"month"]
Day = YMD[,"day"]
# Add it to dat creating new data frame datY
datYMD = cbind(Year, Month, Day, dat)
head(datYMD)
# Canviem els noms de les columnes a 1...nrows.
numberRows = nrow(datYMD)
rowNames = 1:numberRows
row.names(datYMD) = rowNames
head(datYMD)
str(datYMD)
# Triem nomes 2007 i Feb 1 i 2.
dat7 =datYMD[Year=="2007" & Month =="2" & Day %in% c(1,2),]
head(dat7)
# Treiem Date columna
dat7$Date = NULL;head(dat7)
# Ajuntem les dates amb temps amb "-" i convertim en R date format.
dat7$Year = as.character(dat7$Year)
dat7$Month = as.character(dat7$Month)
dat7$Day = as.character(dat7$Day)
str(dat7)
dat7$NewDate = paste(dat7$Year,dat7$Month,dat7$Day,sep="-")
head(dat7);tail(dat7)
dat7$NewDateTime = paste(dat7$NewDate,dat7$Time,sep=" ")
head(dat7);tail(dat7)
dat7$NewDate = as.Date(dat7$NewDate)
str(dat7)
# We also need to convert the electricity columns from factor to numeric
dat7$Global_active_power = as.numeric(as.character(dat7$Global_active_power))
dat7$Global_reactive_power = as.numeric(as.character(dat7$Global_reactive_power))
dat7$Voltage = as.numeric(as.character(dat7$Voltage))
dat7$Global_intensity = as.numeric(as.character(dat7$Global_intensity))
dat7$Sub_metering_1 = as.numeric(as.character(dat7$Sub_metering_1))
dat7$Sub_metering_2 = as.numeric(as.character(dat7$Sub_metering_2))
str(dat7) 
# Now similarly let's convert NewDateTime into a Date Time format POSIXlt
dat7$NewDateTime = strptime(dat7$NewDateTime,"%Y-%m-%d %H:%M:%S"); head(dat7$NewDateTime)
str(dat7)
# One last thing of the pre-processing is removing NA's in this case they're called "?". Checked there's none.
table(dat7[,5:11]=='?')
# Plot 1
hist(dat7$Global_active_power,col="red", main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")