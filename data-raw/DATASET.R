## code to prepare `DATASET` dataset goes here

library(devtools)
library(dplyr);library(tidyr)
pss2=read.csv('pss20.csv')
pss2=pss2 %>% select(-1)
pss2 %>% head(2)
usethis::use_data(DATASET, overwrite = TRUE)
usethis::use_data(pss2, compress='xz')




