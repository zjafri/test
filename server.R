# server.R

library(quantmod)
source("helpers.R")

#add comment to test afasdf %>% 
shinyServer(function(input, output) {

  dataInput <- reactive({
    data <- getSymbols(input$symb, src = "yahoo", 
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
  })
  
  finalInput <- reactive({
    if (!input$adjust) return(dataInput())
    adjust(dataInput())
  })
  
  output$plot <- renderPlot({

    chartSeries(finalInput(), theme = chartTheme("white"), 
      type = "line", log.scale = input$log, TA = NULL)
  })
  #commit1
  #commit2
  
})