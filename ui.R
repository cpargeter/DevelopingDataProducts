library(shiny)

# Define UI for predicting whether wine is going to be good or bad
shinyUI(fluidPage(

  # Application title
  titlePanel("Should I pretend to love, or just like, this wine from Portugal?"),

  # Sidebar with controls to select the variable to plot against mpg
  # and to specify whether outliers should be included
   fluidRow(h4("To use this app to fool your friends, colleagues, loved ones or others
           that you want to impress, be sure to bring a chemical testing kit with you.  
           Take a sample of the wine while they go to the bathroom, or point out a kitten
           stuck in the fake plant that they will be sure to go save.  Once you have the
           chemical make up of the wine, input the characteristics by moving the sliders,
           and impress away!")),
   fluidRow(
        column(2,
                radioButtons(inputId="color", label = h4("Color"),
                choices = list("Red", "White"), 
                selected ="Red")),
        column(2,sliderInput("fixed.acidity", label = h4("Fixed Acidity:"),
                value = 8, min=0,max = 16)),
        column(2,sliderInput("volatile.acidity",label = h4("Volatile Acidity:"),
                value=0.3,min=0,max=2,step=0.1)),
        column(2,sliderInput(inputId="citric.acid",label = h4("Citric Acid"),
                value = 0.3,min=0,max=2,step=0.1)),
        column(2,sliderInput(inputId = "residual.sugar",label = h4("Residual Sugar"),
                value=3,min=0,max=100)),
        column(2,sliderInput(inputId = "chlorides",label=h4("Chlorides"),
                value=.05,min=0,max=1,step=0.05))),
  fluidRow(
        column(2,sliderInput(inputId ="free.sulfur.dioxide",h4("Free Sulfur Dioxide"),
                value = 30,min=0, max = 300,step=5)),
        column(2,sliderInput(inputId ="total.sulfur.dioxide",h4("Total Sulfur Dioxide"),
                value=115,min=0,max=500,step=5)),
        column(2,sliderInput(inputId ="density",h4("Density"),
                value=0.99,min=0.97, max = 1.04,step=0.01)),
        column(2,sliderInput(inputId ="pH",h4("pH"),value=3.2,min=0, max = 7,step=0.1)),
        column(2,sliderInput(inputId ="sulphates",h4("Sulphates"),
                value=0.5,min=0,max=2,step=0.1)),
        column(2,sliderInput(inputId ="alcohol",h4("Alcohol"),
                value=10.5,min=8, max = 15,step=0.1))),
  fluidRow(
          h3("Your wine is predicted to be:"),
                verbatimTextOutput("Prediction"),
          column(3,h4("Model Accuracy:"),
                verbatimTextOutput("Accuracy")),
          column(3,h4("Model Sensitivity:"),
                  tableOutput("Sensitivity")),
          column(3,h4("Model Specificity:"),
                  tableOutput("Specificity"))),
  fluidRow(
          p("Note: Model based on data from P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis."),
          p("Modeling wine preferences by data mining from physicochemical properties."),
          p("In Decision Support Systems, Elsevier, 47(4):547-553, 2009. 
                  Via UCI Machine Learning Repository")
        )
))