 plot4<-function(){

#creates the first plot of the assignment

#load the data if it wasn't sent in
	download.file(url="http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
	destfile="./exdata-data-household_power_consumption.zip")

	conn<-unzip("./exdata-data-household_power_consumption.zip")
	dataRaw<-read.delim(conn[1],sep=";")
	
	#get only the dates we want
	data<-dataRaw[(as.Date(dataRaw$Date,"%d/%m/%Y")>=as.Date("2007-02-01") & 
			   as.Date(dataRaw$Date,"%d/%m/%Y")<=as.Date("2007-02-02")),]
	release raw data
	dataRaw<-0	# a shitty way to release this memory

	
#create the plot
#add a factor for thursday/fri/sat
#x axis is global active power data
#y axis is 2 variables, date (th/fr/sa) and time

	tms<-strptime(paste(as.Date(data$Date,"%d/%m/%Y"),data$Time),"%Y-%m-%d %H:%M:%S")
	par(mfrow=c(2,2)	)
dev.copy(png,file="plot4.png")
#plot 1
	plotData<-as.numeric(as.vector(data$Global_active_power))
	plot(tms,plotData,type="l",ylab="Global Active Power",xlab="")

#plot 2
	p2Data<-as.numeric(as.vector(data$Voltage))
	plot(tms,p2Data,type="l",ylab="Voltage",xlab="datetime")
	
#plot 3
	plotData1<-as.numeric(as.vector(data$Sub_metering_1))
	plotData2<-as.numeric(as.vector(data$Sub_metering_2))
	plotData3<-as.numeric(as.vector(data$Sub_metering_3))


	plot(tms,plotData1,type="l",ylab="Energy sub metering",xlab="",col="black",
	)

	lines(tms,plotData2,col="red")
	lines(tms,plotData3,col="blue")

	legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1",
		"Sub_metering_2","Sub_metering_3"),	
		lty=c(1,1,1),
		lwd=c(2.5,2.5,2.5),
		bty="n")

#plot 4
	p4data<-as.numeric(as.vector(data$Global_reactive_power))
	plot(tms,p4data,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
}

