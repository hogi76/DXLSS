#'step1 - Process capability analysis using data
#'
#' @param xST short term data
#' @param xLT long term data (optional)
#' @param USL upper spec limit
#' @param LSL lower spec limit
#' @param Target target value
#' @return process capability analysis
#' @examples
#' short term : step1(xST=rnorm(30,100,2)  , LSL =95 , USL =105 , Target =100)
#' short & long term : step1(xST=rnorm(30,100,2)  ,xLT=rnorm(30,100,2), LSL =95 , USL =105 , Target =100)


step1=function(xST,xLT=NA,LSL=NA,USL=NA,Target=NA){
  ss.study.ca(xST=xST, xLT = xLT, LSL = LSL, USL = USL, Target = Target)
}



#'step2 - Data exploration, Optimal model verification and confirmation
#'
#' @param x_train : trainset
#' @param x_test : testset
#' @param y1 : y expression of training data( y~. )
#' @param y2 : y expression of test data( y~. )
#' @param y3 : y value of test data( y )
#' @return Linear& random forest model,Residual analysis result, Performance of both models
#' @examples
#' step2(pss2.2  , pss2.3 , pss2.2$throw_Distance~. , pss2.3$throw_Distance~. ,pss2.3$throw_Distance)
#' If there is no test set, put the training set in the test set field


step2=function(x_train,x_test,y1,y2,y3){
  x_train=as.data.frame(x_train)
  pairs(x_train) # Exploring the relationship between x and y
  lm.fit= lm(y1,data=x_train)  #Linear modeling
  rf.fit = randomForest(y1,data=x_train,importance=T) #randomforest modeling
  par(mfrow=c(2,2)) #Residual analysis
  x_test=as.data.frame(x_test)
  pred.lm=predict(lm.fit,newdata=x_test)
  pred.rf=predict(rf.fit,newdata=x_test)
  test_rsq.lm=(cor(y3,pred.lm))^2
  test_rsq.rf=(cor(y3,pred.rf))^2
  return(list(lm_fit=summary(lm.fit),rf_fit=rf.fit,plot(lm.fit),
              test_rsq.lm=test_rsq.lm, test_rsq.rf=test_rsq.rf,
              varImpPlot(rf.fit)))
}




#'step3 - Finding optimal conditions
#'
#' @param x: dataset
#' @return Range, mean of dataset feature, Empty data frame
#' @examples
#' step3(pss2.1)



step3=function(x){
  x1 =apply(x,2,range)
  x2 =apply(x,2,mean)
  return(list(range=x1,mean=x2)) #checking the optimum conditions
}






#'step4 - Finding optimal results using  optimal conditions
#'
#' @param x_train : trainset
#' @param x_test : newX(optimail conditon)
#' @param y1 : y expression of training data( y~. )
#' @param y2 : y expression of newX( y~. )
#' @param y3 : y value of NewX( y )
#' @return
#' @examples  optimal results
#' step4(pss2.2  , pss2.3 , pss2.2$Firing_range~. , pss2.3$Firing_range~. ,pss2.3$Firing_range)
#' If there is no test set, put the training set in the test set field
#' Enter the news example name and value in data.frame parentheses
#' newx=data.frame(Firing_range=128, Number_of_ropes=3,Torsion_powered=49, catapult_weight=46, Catapult_armlength=38, Stopper_angle=48)



step4=function(x_train,x_test,y1,y2,y3){
  x_train=as.data.frame(x_train)
  lm.fit= lm(y1,data=x_train)  #Linear modeling
  rf.fit = randomForest(y1,data=x_train,importance=T) #randomforest modeling
  x_test=as.data.frame(x_test)
  pred.lm=predict(lm.fit,newdata=x_test)
  pred.rf=predict(rf.fit,newdata=x_test)
  return(list("Optimal predicted value of lm"=pred.lm,"Optimal predicted value of randomForest"=pred.rf))
}
