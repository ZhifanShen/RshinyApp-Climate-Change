#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Climate Changing is Real"),
  
  #first feature
  radioButtons("datasource","Data Sources for Co2",
               c("Data Sourse World" = "DataWorld",
                 "Data Sourse Northern Hemisphere" = "DataNorth")),
  #second feature
  conditionalPanel(
    condition = "input.datasource == 'DataNorth'",
    selectInput("NorthArea","Compare with different hemisphere",
                c("Latitude30"="Latitude30",
                  "Latitude33"="Latitude33",
                  "Latitude37"="Latitude37",
                  "Latitude41"="Latitude41",
                  "Latitude44"="Latitude44",
                  "Latitude49"="Latitude49",
                  "Latitude53"="Latitude53",
                  "Latitude58"="Latitude58",
                  "Latitude64"="Latitude64",
                  "Latitude72"="Latitude72",
                  "Latitude90"="Latitude90")
                )
    ),#end of conditional panel
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("ylim",
                   "Max of ylim for Co2 Data:",
                   min = 400,
                   max = 600,
                   step = 10,
                   value = 450),
       #for tab2
       radioButtons("tempsource","Vancouver Annual Temperature",
                    c("Mean Temperature" = "mean",
                      "Max Temperature" = "max","Min Temperature"="min")),
       
       checkboxInput("movingavg",strong("Add Moving Avg for Vancouver Mean Temperature"),value = FALSE),
       
       conditionalPanel(
         condition = "input.movingavg == true",
         selectInput("MovingRange","Choose a moving window",c("3 years"= 3,"5 years"= 5 ,"10 years"= 10))
       ),
       
       
       
       
       
       
       #for reference
       checkboxInput("reference",strong("Show Reference"),value = FALSE)
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(
      
      
      tabsetPanel(
            tabPanel("Co2 Levels Data",plotOutput("distPlot")),
            tabPanel("Vancouver Annual Temperature",plotOutput("tempPlot")),
            tabPanel("Co2 levels Changes with Temperature",plotOutput("CompPlot")),
            tabPanel("About",source("about.R")$value())
      
         ),
      
      
      htmlOutput("Reference")
       
       
       
       
       
       
    )
  )
))
