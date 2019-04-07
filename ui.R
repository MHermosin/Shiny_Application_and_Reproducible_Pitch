library(shiny)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("External Service Company Score"),
  
  sidebarPanel(
    numericInput('Cost', 'Insert the score on cost in percent', 70,min = 0, max = 100, step = 0.5) ,
    numericInput('Execution_Time', 'Insert the score on execution time in percent', 85, min = 0, max = 100, step = 0.5),
    numericInput('Quality', 'Insert the score on quality in percent', 90, min = 0, max = 100, step = 0.5)
  ), 
  mainPanel(
    p('An organization is comparing the offers received for the execution of a repair work and those responsible were asked to rate three factors, being: cost, execution time, and quality.'),
    p('The result of the three factors was interpreted as follows:'),
    tags$div(
      tags$ul(
        tags$li('Average <80 , : Failed'),
        tags$li('Average [80-89] , : Considered request future offers'),
        tags$li('Average [90-94] , : Considered as a second option'),
        tags$li('Average >= 95 , : Considered for the execution of the work')
      )
    ),
    
    h4('Taking into account the values entered by you:'), 
    p('Cost:'), verbatimTextOutput("inputCostmark"),
    p('Execution Time:'), verbatimTextOutput("inputExecutionTimemark"),
    p('Quality:'), verbatimTextOutput("inputQualitymark"),h4('Your calulated AVERAGE RESULT is:'),
    verbatimTextOutput("estimation"),
    p('It means that you have:'),strong(verbatimTextOutput("diagnostic"))
    
  )
))
