 plot1<-function(){

#creates the first plot of the assignment

#load the data if it wasn't sent in
	download.file(url="http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
	destfile="./exdata-data-household_power_consumption.zip")

	conn<-unzip("./exdata-data-household_power_consumption.zip")
	dataRaw<-read.delim(conn[1],sep=";")
	
	#get only the dates we want
	data<-dataRaw[(as.Date(dataRaw$Date,"%d/%m/%Y")>=as.Date("2007-02-01") & 
			   as.Date(dataRaw$Date,"%d/%m/%Y")<=as.Date("2007-02-02")),]
	#release raw data
	dataRaw<-0	# a shitty way to release this memory
	
#create the plot
	plotData<-as.numeric(as.vector(data$Global_active_power))
	hist(plotData,col="RED",xlab="Global Active Power (killowatts)",
		ylab="Frequency", main="Global Active Power")

	dev.copy(png,file="plot1.png")
	dev.off()
}