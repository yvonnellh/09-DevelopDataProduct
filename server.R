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
  
  model1 <- lm(disp ~ hp, data = mtcars)
  
  model1pred <- reactive({
    hpInput <- input$sliderHP
    predict(model1, newdata = data.frame(hp = hpInput))
  })
 
  output$plot1 <- renderPlot({
    hpInput <- input$sliderHP
    plot(mtcars$hp, mtcars$disp, xlab = "Horsepower",
         ylab = "Display", bty = "n", pch = 16,
         xlim = c(0, 350), ylim = c(0, 600))
    if(input$showModel1){
      abline(model1, col = "red", lwd = 2)
    }

    points(hpInput, model1pred(), col = "red", pch = 16, cex = 2)
    
    })
    
  output$pred1 <- renderText({
             model1pred()
  })
  
})
