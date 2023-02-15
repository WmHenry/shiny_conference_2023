library(shiny)

ui <- fluidPage(
  plotOutput("aa")
)

server <- function(input, output, session) {
  output$aa <- renderPlot({
    pl
  })
}

shinyApp(ui, server)
