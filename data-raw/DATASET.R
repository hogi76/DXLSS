## code to prepare `DATASET` dataset goes here

library(dplyr);library(tidyr)
pss5=read.csv('PSS2_rawdata5.csv')
colnames(pss5)[2:6]

usethis::use_data(DATASET, overwrite = TRUE)
usethis::use_data(pss5, compress='xz')


colnames(pss4)
pss2 %>% head(2)
