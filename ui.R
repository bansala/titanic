library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("If You Were On The Titanic..."),
  sidebarPanel(
    h4('Please specify the details of the traveller to see if they would have survived'),
    sliderInput(inputId="age", label = "Age of traveller", min=1, max=100, value=35),
    sliderInput(inputId="siblings", label = "No of siblings", min=0, max=8, value=0),
    selectInput(inputId="class", label = "Class of Travel",choices=list("Class 1"=1, "Class 2"=2,"Class 3"=3) ),
    radioButtons("sex", label="Gender", choices=list("Male"= 'male', "Female"='female')),
    actionButton("gobutton", "Calculate!")
  ),
  mainPanel(
    p('A simple GLM model was trained on the Titanic data set from Kaggle. It has about 77% accuracy. Fill out details in the sidebar to see if the model predicts the traveller surviving.'),
    h4('Survival Probability : '), 
    h4(textOutput('survival') )
   
   
  )
))