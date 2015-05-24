# Load data processing file
source("https://raw.githubusercontent.com/rafareds/Course9/master/dengue.R")

graf1 <- function(anoIn){
  inicio <- AirPassengers$mes[dengue$ano == anoIn][1]
  plot(dengue$casos[inicio:180], t = "l", col = "darkslategrey", lwd = 2, 
       xlab = "Month", ylab = "Cases", main = "Cases of Dengue")
}

shinyServer(
  function(input, output){
    output$dTable <- renderDataTable({
      dengue
    })
    output$plot1 <- renderPlot({
      graf1(input$value)
    })
    output$plot2 <- renderPlot({
      graf2(input$value)
    })
  }
)