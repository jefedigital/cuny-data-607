# Your task is to create an R dataframe that shows rates of tuberculosis infection by country

library(tidyverse)
library(RMySQL)
library(DBI)

# tb cases (MySQL)

db <- DBI::dbConnect(RMySQL::MySQL(), host = "localhost", user = "root", password = "F0rward2022!", dbname= "tb")

q <- "select 
		country,
		year,
		sum(child) as cases_child,
		sum(adult) as cases_adult,
		sum(elderly) as cases_elderly
	from tb.tb
	group by country, year
	having cases_total > 0
	order by country, year"

df_tb <- dbFetch(dbSendQuery(db,q))

str(df_tb)
head(df_tb,20)

df_tb[df_tb < 0] <- 0
head(df_tb,20)


# population

df_pop <- read_csv('data/population.csv')
str(df_pop)
head(df_pop)


# joined table

df <- left_join(df_tb, df_pop, by=c('country','year'))

df

# still a bunch of negative values .. correct to zero?