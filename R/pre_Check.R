#'pre_check - install required packages
#'
#' @return Install and load required packages-'qcc','SixSigma','randomForest','devtools' package
#' @examples
#' pre_check(  )


pre_check=function(){
  RequiredPackages = c('qcc','SixSigma','randomForest','devtools')
  for (i in RequiredPackages) { #Installs packages if not yet installed
    if(! i%in% row.names(installed.packages())) install.packages(i)
  }
  library('qcc')
  library('SixSigma')
  library('randomForest')
  library('devtools')
}
