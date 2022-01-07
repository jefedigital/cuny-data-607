library(tidyverse)
library(RMySQL)

tinyspam_files <- list.files('data/spam/tinyspam', full.names=TRUE)
spam_files <- list.files('data/spam/spam', full.names=TRUE)
spam_2_files <- list.files('data/spam/spam_2', full.names=TRUE)
easy_ham_files <- list.files('data/ham/easy_ham', full.names=TRUE)
easy_ham_2_files <- list.files('data/ham/easy_ham_2', full.names=TRUE)
hard_ham_files <- list.files('data/ham/hard_ham', full.names=TRUE)

## SQL vars and functions

con <- dbConnect(RMySQL::MySQL(), user='root', dbname = 'cuny607')

query <- function(q){
  dbSendQuery(con,q)
}

# create table

query('drop table if exists spam;')

query('create table if not exists spam (
	source char(20), 
	label char(20), 
	email text(65535)
	);')


## parse emails from a directory

src = 'spam' # data source
lbl = 'spam' # data label "ham" or "spam"

email <- vector() # declare empty vector

for (e in spam_files){
  email <- append(email, read_file(e))
}

source <- rep(src,length(email)) 
label <- rep(lbl,length(email))

df <- data.frame(source, label, email) 

dbWriteTable(con, 'spam', df, append=TRUE)

##

# have to clean up a bunch of special chars (\\n, \\t etc)







