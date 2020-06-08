#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

calculatebasalmetabolicrate <- function (weightKG,heightCM, age, male = TRUE){
    # Based on Mifflin-St Jeor Formula
    (10 * as.numeric(weightKG)) + (6.25 * as.numeric(heightCM)) - (5 * as.numeric(age)) + ifelse(male, 5, -161)
}


shinyServer(function(input, output) {
    
    basalmetabolicrate <- reactive({
        calculatebasalmetabolicrate(
            input$weightKG,
            input$heightCM,
            input$age,
            input$gender == "Male"
        )
    })
    output$basalmetabolicrate <- renderText({basalmetabolicrate()})
    output$sedentarytdee <- renderText({basalmetabolicrate() * 1.2}) 
    output$lightexcersicetdee <- renderText({basalmetabolicrate() * 1.375}) 
    output$moderateexcersicetdee <- renderText({basalmetabolicrate() * 1.55}) 
    output$heavyexcersicetdee <- renderText({basalmetabolicrate()  * 1.725})
    output$atheletetdee <- renderText({basalmetabolicrate()  * 1.9})
    
})
