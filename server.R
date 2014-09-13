library(shiny)
library(e1071)
library(caret)
library(randomForest)

red<-read.csv("winequality/winequality-red.csv", sep=";")
white<-read.csv("winequality/winequality-white.csv", sep=";")

set.seed(123)

red$GB<-factor(ifelse(red$quality<5,0,ifelse(red$quality<7,1,2)))
white$GB<-factor(ifelse(white$quality<5,0,ifelse(white$quality<7,1,2)))

inTrain<-createDataPartition(y=red$quality,p=.7,list=F)
train.red<-red[inTrain,]
test.red<-red[-inTrain,]

inTrain<-createDataPartition(y=white$quality,p=.7,list=F)
train.white<-white[inTrain,]
test.white<-white[-inTrain,]

trControl=trainControl(method="cv",allowParallel = T)

mod.red<-randomForest(GB ~.,data=train.red[,-c(12)],ntree=20)
mod.white<-randomForest(GB ~.,data=train.white[,-c(12)],ntree=20)

pred.red<-predict(mod.red,test.red[,-c(12:13)])
pred.white<-predict(mod.white,test.white[,-c(12:13)])

predictWine<-function(color,data){
        ifelse(color == "Red",
                {
                        pred<-predict(mod.red,data)
                        con<-confusionMatrix(pred.red,test.red[,13])},
                {
                        pred<-predict(mod.white,data)
                        con<-confusionMatrix(pred.white,test.white[,13])}
        )
        x<-ifelse(pred==0,"Terrible!  Pretend to hate it!",
                ifelse(pred == 1, "Medium - Pretend to find both good and bad parts of the wine, and order another glass, to decide.",
                        "Amazing!  Best wine you have had since that trip to Napa!"))
        list(x,con)
}

shinyServer(function(input, output) {
        observe({
        InputData <- reactive({
                # Compose data frame
        df <- data.frame(
                        fixed.acidity=input$fixed.acidity,
                        volatile.acidity = input$volatile.acidity,
                        citric.acid = input$citric.acid,
                        residual.sugar = input$residual.sugar,
                        chlorides = input$chlorides,
                        free.sulfur.dioxide = input$free.sulfur.dioxide,
                        total.sulfur.dioxide = input$total.sulfur.dioxide,
                        density = input$density,
                        pH = input$pH,
                        sulphates = input$sulphates,
                        alcohol = input$alcohol)
                return(list(df=df))
                })
        data<-InputData()$df
        pred<-predictWine(input$color,data)
                
        output$Prediction<-renderText({pred[[1]][1]})
        con<-pred[[2]]
        output$Accuracy<-renderPrint({con$overall[1]})
                sens<-data.frame(Sensitivity = con$byClass[,1])
                rownames(sens)<-c("Poor","Medium","Good")
        output$Sensitivity<-renderTable({sens})
                spec<-data.frame(Specificity = con$byClass[,2])
                rownames(spec)<-c("Poor","Medium","Good")
        output$Specificity<-renderTable({spec})
        })
})