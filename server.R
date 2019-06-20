#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    
    if (input$datasource == "DataWorld") {
      load("C02Worldwide.Rdata")
      plot(Co2World$YearDecimal,Co2World$Value,main = "CO2 Levels Worldwide Average",ylim = c(300,input$ylim),
           type = "l",xlab = "Year",ylab = "CO2 ppm")
    }
    else{
      load("C02NorthernHemisphere.Rdata")
      x = (Co2North[,2]+Co2North[,4]+Co2North[,6]+Co2North[,8]+
               Co2North[,10]+Co2North[,12]+Co2North[,14]+Co2North[,16]+
               Co2North[,18]+Co2North[,20]+Co2North[,22])/11
      
      plot(Co2North$YearDecimal,x,type="l",ylim = c(300,input$ylim),main = "CO2 Levels North Hemisphere Average",xlab = "Year",ylab = "CO2 ppm")
      if(input$NorthArea == "Latitude30"){
        lines(Co2North$YearDecimal,Co2North$Latitude30value,col="red",ylim = c(300,input$ylim))
      }
      if(input$NorthArea == "Latitude33"){
        lines(Co2North$YearDecimal,Co2North$Latitude33value,col="red",ylim = c(300,input$ylim))
      }
      if(input$NorthArea == "Latitude37"){
        lines(Co2North$YearDecimal,Co2North$Latitude37value,col="red",ylim = c(300,input$ylim))
      }
      if(input$NorthArea == "Latitude41"){
        lines(Co2North$YearDecimal,Co2North$Latitude41value,col="red",ylim = c(300,input$ylim))
      }
      if(input$NorthArea == "Latitude44"){
        lines(Co2North$YearDecimal,Co2North$Latitude44value,col="red",ylim = c(300,input$ylim))
      }
      if(input$NorthArea == "Latitude49"){
        lines(Co2North$YearDecimal,Co2North$Latitude49value,col="red",ylim = c(300,input$ylim))
      }
      if(input$NorthArea == "Latitude53"){
        lines(Co2North$YearDecimal,Co2North$Latitude53value,col="red",ylim = c(300,input$ylim))
      }
      if(input$NorthArea == "Latitude58"){
        lines(Co2North$YearDecimal,Co2North$Latitude58value,col="red",ylim = c(300,input$ylim))
      }
      if(input$NorthArea == "Latitude64"){
        lines(Co2North$YearDecimal,Co2North$Latitude64value,col="red",ylim = c(300,input$ylim))
      }
      if(input$NorthArea == "Latitude72"){
        lines(Co2North$YearDecimal,Co2North$Latitude72value,col="red",ylim = c(300,input$ylim))
      }
      if(input$NorthArea == "Latitude90"){
        lines(Co2North$YearDecimal,Co2North$Latitude90value,col="red",ylim = c(300,input$ylim))
      }
      
    }
    
  })
  #end of tab1
  #begin of tab2
  output$tempPlot <- renderPlot({
    #Lets do vancouver mean temp first
    if (input$tempsource == "mean") {
      load("CanadianMeanTemp.Rdata")
      MeanTemp[MeanTemp==-9999.9]=NA
      MeanTemp = na.omit(MeanTemp)
      vancouver = MeanTemp[MeanTemp$`InfoTemp[2]`=="VANCOUVER",]
      plot(vancouver$Year,vancouver[,"Annual"],type = "l",lwd=2,main = "Vancouver Mean Temp Annually",xlab = "Year",ylab = "Temperature")
      
      if (input$movingavg == TRUE) {
        lines(ksmooth(vancouver$Year,vancouver[,"Annual"],bandwidth = input$MovingRange),col=2,lwd=3)
      }
    }
    if (input$tempsource == "max") {
      load("CanadianMaxTemp.Rdata")
      MaxTemp[MaxTemp==-9999.9]=NA
      MaxTemp = na.omit(MaxTemp)
      vancouverMax = MaxTemp[MaxTemp$`InfoTemp[2]`=="VANCOUVER",]
      plot(vancouverMax$Year,vancouverMax[,"Annual"],type = "l",lwd=2,main = "Vancouver Max Temp Annually",xlab = "Year",ylab = "Temperature")
      
      if (input$movingavg == TRUE) {
        lines(ksmooth(vancouverMax$Year,vancouverMax[,"Annual"],bandwidth = input$MovingRange),col=2,lwd=3)
      }
    }
    if (input$tempsource == "min") {
      load("CanadianMinTemp.Rdata")
      MinTemp[MinTemp==-9999.9]=NA
      MinTemp = na.omit(MinTemp)
      vancouverMin = MinTemp[MinTemp$`InfoTemp[2]`=="VANCOUVER",]
      plot(vancouverMin$Year,vancouverMin[,"Annual"],type = "l",lwd=2,main = "Vancouver Min Temp Annually",xlab = "Year",ylab = "Temperature")
      
      if (input$movingavg == TRUE) {
        lines(ksmooth(vancouverMin$Year,vancouverMin[,"Annual"],bandwidth = input$MovingRange),col=2,lwd=3)
      }
    }
   
    
  })
  #end of tab2
  #begin of tab3
  output$CompPlot <- renderPlot({
    par(mar = c(7, 4, 4, 4) + 1)
    lattitude49 = Co2North$Latitude49value
    year = as.integer(Co2North$YearDecimal)
    newtable = data.frame(Year = year,Lattitude49 = lattitude49)
    newtablemean = aggregate(newtable$Lattitude49~newtable$Year,newtable,mean)
    newtablemean = newtablemean[1:39,]  #first graph
    newvantemp = vancouver[vancouver$Year>=1979,]  #second graph
    
    plot(newtablemean$`newtable$Year`,newtablemean$`newtable$Lattitude49`,type = "l",lwd=3,xlab = "Year",ylab = "Co2 ppm",main = "Comparison Trends Between \n Co2 and Temperature (1979-2017)")
    par(new = TRUE)
    plot(ksmooth(newvantemp$Year,newvantemp$Annual,bandwidth = 10),axes= FALSE,xlab=" ",ylab=" ",type = "l",col=2,lwd=3,ylim=c(9.8,11))
    mtext("Temperature",side=4,col="red",line=3) 
    axis(4, ylim=c(9.8,11), col="red",col.axis="red",las=1)
    legend(x="topleft",c("Co2 Latitude49","Moving Avg Temp Van"),col = c(1,2),lty = c(1,1),lwd = c(3,3))
    mtext("This graph shows how CO2 and temperature trend together in Vancouver over the past 40 years.",side = 1,line = 6,font = 3,col = "darkgreen",cex = 1.2)
  })
  #end of tab3
  
  output$Reference <- renderText({
    if (input$reference == TRUE) {
      paste("1. Dlugokencky, E.J., K.W. Thoning,P.M. Lang, and P.P. Tans (2017), NOAA Greenhouse Gas Reference from
            Atmospheric Carbon Dioxide Dry Air Mole Fractions from the NOAA ESRL
            Carbon Cycle Cooperative Global Air Sampling Network.","2. Wang, X.L, Y. Feng, L. A. Vincent, 2013. Observed changes in 
            one-in-20 year extremes of Canadian surface air temperatures. Atmosphere-Ocean. Doi:10.1080/07055900.2013.818526.","3. Vincent, L. A., 
            X. L. Wang, E. J. Milewska, H. Wan, F. Yang, and V. Swail, 2012. A second generation of homogenized Canadian monthly surface air temperature for climate trend analysis, J. Geophys. Res., 117, D18110, doi:10.1029/2012JD017859.",sep="<br/>")
      
    }
    
  })
  
})
