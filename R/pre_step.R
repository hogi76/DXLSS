#'prestep1 - Check the pre-treatment level
#'
#' @param x dataset
#' @param y y_values of dataset
#' @return Data structure, Number of missing values, Outliers of data
#' @examples
#' prestep1(pss1,pss1$Firing_range)



prestep1=function(x,y){
  str(x) #Data structure check
  a1=head(x,10) #Check the leading line of data
  a2=sum(is.na(x))
  a3=with(x,boxplot(y))
  abline(h=(a3$stats[c(1,5),]),col="red",lty="dotted")
  return(list("data structure"=a1, "Number of missing values"=a2,a3))
}



#' prestep2 - Run preprocessing
#'
#' @param x dataset
#' @param y y_values of dataset
#' @return Returns x dataset excluding missing and outlier values of y
#' @examples
#' prestep2(pss1,pss1$Firing_range)


prestep2=function (x, y){
  x1=na.omit(x[!y %in% boxplot.stats(y)$out, , drop = FALSE])
  # Remove missing values using the na.omit function
  # Index data excluding outliers of y values
  return(x1)
}



#'prestep3 - Dividing the dataset into test and verification sets
#'
#' @param x dataset
#' @return trainset & testset
#' @examples
#' prestep3(pss2)


prestep3=function(x){
  set.seed(0)
  train=sample(nrow(x),nrow(x)*0.7)
  x_train=x[train,]  #Data for model training
  x_test=x[-train,]  #Data for model testing
  return(list(train = x_train, test = x_test))
}

