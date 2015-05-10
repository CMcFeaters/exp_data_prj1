 plot2<-function(data){

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

	


	plotData<-as.numeric(as.vector(data$Global_active_power))
	tms<-strptime(paste(as.Date(data$Date,"%d/%m/%Y"),data$Time),"%Y-%m-%d %H:%M:%S")

	plot(tms,plotData,type="l",ylab="Global Active Power (kilowatts)",xlab="")
	dev.copy(png,file="plot2.png")
	dev.off()
	
}
