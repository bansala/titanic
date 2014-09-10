library(rCharts)
library(shiny)

train = read.csv("train.csv")
model.glm = glm(Survived ~ Pclass+Sex+Age+SibSp, data=train, family=binomial(link=logit))

shinyServer(
    function(input, output) {
      
      prediction <- reactive({
        age <- as.numeric(input$age)
        sex <- input$sex
        class <- as.numeric(input$class)
        siblings <- as.numeric(input$siblings)
        topred <- data.frame(Sex=sex, Pclass=class, Age=age, SibSp=siblings)
        p = predict.glm(model.glm, newdata=topred, na.action=na.pass, type='response')
        pred = round(p[1] *100, 2)
        return(paste(as.character(pred), " %"))
      })
       output$survival = renderText({
         if(input$gobutton == 0) "not calculated yet."
         else prediction()
        })
    }    
)