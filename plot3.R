 plot3<-function(){

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

	


	plotData1<-as.numeric(as.vector(data$Sub_metering_1))
	plotData2<-as.numeric(as.vector(data$Sub_metering_2))
	plotData3<-as.numeric(as.vector(data$Sub_metering_3))
	tms<-strptime(paste(as.Date(data$Date,"%d/%m/%Y"),data$Time),"%Y-%m-%d %H:%M:%S")

	plot(tms,plotData1,type="l",ylab="Energy sub metering",xlab="",col="black",
	)

	lines(tms,plotData2,col="red")
	lines(tms,plotData3,col="blue")

	legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1",
		"Sub_metering_2","Sub_metering_3"),	
		lty=c(1,1,1),
		lwd=c(2.5,2.5,2.5))
	dev.copy(png,file="plot3.png")
	dev.off()
}