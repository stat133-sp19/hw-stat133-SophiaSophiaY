#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(reshape2)
library(ggplot2)

ui <- fluidPage(
  
  #Part1. Six Variables
  titlePanel("Investment Scenarios Modeling"),
  fluidRow(
    column(4,
           sliderInput("initial",
                       "Initial Amount",
                       min = 0,
                       max = 100000,
                       step = 500,
                       value = 1000,
                       pre = "$"), 
           sliderInput("annual",
                       "Annual Contribution",
                       min = 0,
                       max = 50000,
                       step = 500,
                       value = 2000,
                       pre = "$")
    ),
    column(4, 
           sliderInput("return",
                       "Return Rate (in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 5),
           sliderInput("growth",
                       "Grwoth Rate (in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 2)
    ),
    column(4,
           sliderInput("years",
                       "Years",
                       min = 0,
                       max = 50,
                       step = 1,
                       value = 20),
           selectInput("is_facet",
                       "Facet?",
                       choices = c("No", "Yes")))
  ),
  h4("Timelines"),
  plotOutput("Plot"),
  h4("Balances"),
  verbatimTextOutput(outputId = "balances")
  
)


#functions

future_value <- function(amount = 0, rate = 0, years = 0) {
  future_value <- amount * (1 + rate) ^ years
  return(future_value)}

annuity <- function(contrib = 0, rate = 0, years = 0) {
  annuity <- contrib * (((1+rate)^years-1)/rate)
  return(annuity)}

growing_annuity <- function(contrib = 0, rate = 0, growth = 0, years = 0) {
  growing_annuity <- contrib * (((1+rate)^years-(1+growth)^years)/(rate-growth))
  return(growing_annuity)}



server <- function(input,output){
  table <- reactive({
    amount = input$initial
    years = input$years
    rate = input$return / 100
    growth = input$growth / 100
    contribution = input$annual
    num <- rep(amount, years + 1)
    
    table <- data.frame(year = 0:years, no_contrib = num, fixed_contrib = num, growing_contrib = num)
    
    for (year in 0:input$years){
      no_contrib = future_value(amount, rate, year) 
      table$no_contrib[year + 1] = no_contrib
      
      fixed_contrib = annuity(contribution, rate, year) 
      table$fixed_contrib[year + 1] = no_contrib + fixed_contrib
      
      growing_contrib = growing_annuity(contribution, rate, growth, year)
      table$growing_contrib[year + 1] = no_contrib + growing_contrib
    }
    table
  })
  
  #Part2. Two modes of is_facet and plots
  output$Plot <- renderPlot({
    melt_table <- melt(table(), id.vars = "year")
    if (input$is_facet == "No") {
      ggplot(melt_table, aes(x = year, y = value )) + geom_line(aes(color = variable)) + geom_point(aes(color = variable)) + ggtitle("Three modes of investing")}
    else { ggplot(melt_table, aes(x = year, y = value)) + geom_line(aes(color = variable)) + geom_point(aes(color = variable)) + facet_wrap(~ variable) + ggtitle("Three modes of investing") + geom_area(aes(fill = variable), alpha = 0.3) + theme_light()}
  })
  
  #Part3. Print Balances
  output$balances <- renderPrint({table()})
}


shinyApp(ui = ui, server = server)

