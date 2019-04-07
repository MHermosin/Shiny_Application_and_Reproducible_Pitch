library(shiny)

Average_Factor<-function(Cost,Execution_Time,Quality) {(0.6*Cost + 0.25*Execution_Time + 0.15*Quality)}

diagnostic_f<-function(Cost, Execution_Time, Quality){
  Average_value<-(0.6*Cost + 0.25*Execution_Time + 0.15*Quality)
  ifelse(Average_value<80,"Failed", ifelse(Average_value >=80 & Average_value<90 ,"Request future offers",ifelse(Average_value >= 90 & Average_value < 95 ,"Second option",ifelse(Average_value>=95 ,"Suitable for the execution of the work")))
  )}

shinyServer(
  function(input, output) {
    
    output$inputcostmark <- renderPrint({input$Cost})
    output$inputexecutionTimemark <- renderPrint({input$Execution_Time})
    output$inputqualitymark <- renderPrint({input$Quality})
    output$estimation <- renderPrint({Average_Factor(input$Cost,input$Execution_Time,input$Quality)})
    output$diagnostic <- renderPrint({diagnostic_f(input$Cost,input$Execution_Time,input$Quality)})
  } 
)