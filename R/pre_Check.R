#'pre_check - install required packages
#'
#' @return Install and load required packages-'qcc','SixSigma','randomForest','devtools' package
#' @examples
#' pre_check(  )


pre_check=function(){
  RequiredPackages = c("qcc", "SixSigma", "randomForest")
  for (i in RequiredPackages) {
    if (!i %in% row.names(installed.packages())) install.packages(i)
  }
  library("qcc")
  library("SixSigma")
  library("randomForest")
  return(list('Working folder'=getwd(),'Files in the working folder'=dir()))
}






