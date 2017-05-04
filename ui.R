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
  titlePanel("Predict Display From Horsepower"),
  h4("This application uses the 'mtcars' databases. It allows users to select the 'horsepower' of the car in order to predict the 'display' of a car."),
  h4("From the left panel, please move the slider to select the 'horsepower' and the prediction of 'display' will be shown below the plot on the right panel"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderHP",
                   "What is the Horsepower of the car?",
                   min = 0,
                   max = 400,
                   value = 200),
       checkboxInput("showModel1", "Show/Hide Model", value=TRUE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted Display from Model:"),
      textOutput("pred1")
    )
  )
))
