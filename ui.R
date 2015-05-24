shinyUI(pageWithSidebar(
  headerPanel("Dengue Fever Cases"),
  sidebarPanel(
    sliderInput('value','Year',value = 2000, min = 2000, max = 2014, step = 1,)
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Plot1", plotOutput('plot1')),
      tabPanel("Plot2", plotOutput('plot2'))
    )
  )
))