  library(shiny)

# Define UI for application that draws a scatter plot with a conditional regression line based off current wait time.
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("waited",
                  "How long have you been waiting:",
                  min = 0,
                  max = 92,
                  value = 0)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("xyPlot")
    )
  )
))