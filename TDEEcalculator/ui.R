#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("TDEE calculator"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("weightKG", "Your weight in KG", 60),
            textInput("heightCM", "Your height in CM", 180),
            textInput("age", "Your age", 30),
            radioButtons("gender", "Your gender", c("Male", "Female"))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h2("TDEE calculator"),
            p("TDEE is the Total Daily Energy Expenditure"),
            p("It is an estimation of how many calories you burn per day when exercise is taken into account. It is calculated by first figuring out your Basal Metabolic Rate, then multiplying that value by an activity multiplier."),
            p("Based on Mifflin-St Jeor Formula"),
            hr(),
            p(strong("Put your weight in kilograms, height in centimeters, age and gender in the left fields")),
            
            
            p("Your basal metabolic rate is: ", textOutput("basalmetabolicrate")),
            p("Your calorie burning rate when sedentry is: ", textOutput("sedentarytdee")),
            p("Your calorie burning rate when lightly active is: ", textOutput("lightexcersicetdee")),
            p("Your calorie burning rate when moderatly active is: ", textOutput("moderateexcersicetdee")),
            p("Your calorie burning rate when heavly active is: ", textOutput("heavyexcersicetdee")),
            p("Your calorie burning rate when athelete is: ", textOutput("atheletetdee")),
        )
    )
))
