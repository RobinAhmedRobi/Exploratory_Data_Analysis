## Getting full the dataset
########################
df <- read.csv("./EDA_course/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

## Subsetting the data
########################
df_subset_dates <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(df)

## Converting dates
########################
df_conv_subset_dates <- paste(as.Date(df_subset_dates$Date), df_subset_dates$Time)
df_subset_dates$Datetime <- as.POSIXct(df_conv_subset_dates)


## Second Plot
########################
plot(df_subset_dates$Global_active_power~df_subset_dates$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Save
########################
dev.copy(png, file="./EDA_course/EDA_C_W1/project/plot2.png", height=480, width=480)
dev.off()