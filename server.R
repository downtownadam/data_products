  library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$xyPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    condDist <- faithful[faithful$waiting > input$waited,]
    z <- lm(eruptions~waiting,data=condDist)
    #y < - faithful[faithful$waiting > input$waited,"eruptions"]
    titleText <- c(paste("Expected Time Until Eruption: ",
                         round(mean(condDist$waiting)-input$waited,1)," minutes"),
                   paste("Expected Duration of Eruption: ",
                         round(mean(condDist$eruptions),1)," minutes"),
                   paste("Likelihood of Eruption within Next Five Minutes: ",
                         round(mean(condDist$waiting <= input$waited+5)*100,1),"%")
                   
    )
    
    # draw the histogram with the specified number of bins
    plot(y=faithful$eruptions,x=faithful$waiting,
         xlab="Waiting Time",
         ylab="Eruption Length (mins)",
         main=titleText)
    abline(z,wt=2,col="blue")
    abline(v=input$waited)
    points(x=mean(faithful[faithful$waiting>input$waited,"waiting"]),
           y=mean(faithful[faithful$waiting>input$waited,"eruptions"]),
           type="p", col="red",
           pch=19, cex=2)
    
    
    
    
  })
  
})