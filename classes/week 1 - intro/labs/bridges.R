library(tidyverse)

cols <- c('IDENTIF','RIVER','LOCATION','ERECTED','PURPOSE','LENGTH','LANES','CLEAR-G','T-OR-D','MATERIAL','SPAN','REL-L','TYPE')

df <- read_csv('bridges_data', col_names=cols, na=c('','NA','?'))

df <- read_csv('bridges_data', col_names=cols, na=c('','NA','?'), col_types='cfdfffdffffff')

summary(df)



