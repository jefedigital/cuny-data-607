# Your task is to create an R dataframe that shows rates of tuberculosis infection by country

library(tidyverse)
library(RMySQL)
library(DBI)

# mysql
db <- DBI::dbConnect(RMySQL::MySQL(), host = "localhost", user = rstudioapi::askForPassword("user"), password = rstudioapi::askForPassword("password"), dbname= "film_scores")

q_simple <- 
"select * from all_scores"

df_simple <- dbFetch(dbSendQuery(db,q_simple))
str(df_simple)

q_norm <- 
"select 
	s.id,
	f.film_title,
	c.critic_name,
	s.score
from scores as s
left join films as f
	on s.film_id = f.id
left join critics as c
	on s.critic_id = c.id;"

df_norm <- dbFetch(dbSendQuery(db,q_norm))
str(df_norm)

# pick one

df <- df_norm

# etl

## replace NA
df <- df[!is.na(df$score),]
str(df)

# eda

## average scores by film

df_films <- df %>% group_by(film_title) %>% summarize(views = n(), avg_score = mean(score), hi_score = max(score), lo_score = min(score), sd = sd(score)) %>% arrange(desc(avg_score))

df_films


## count of films by person

df_critics <- df %>% group_by(critic_name) %>% summarize(views = n(), avg_score = mean(score), hi_score = max(score), lo_score = min(score), sd = sd(score)) %>% arrange(desc(avg_score))

df_critics

## charts

df_films %>% 
  ggplot(aes(x=reorder(film_title, -avg_score), y=avg_score, label=round(avg_score,1))) + 
  geom_bar(stat='identity', fill='blue', alpha=.6) +
  geom_text(vjust=2, color='white') +
  ggtitle("Avg Score by Film") +
  xlab('Film Title') +
  ylab('Avg Score') +
  theme(axis.text.x = element_text(angle=45, hjust=1))


df_films %>% 
  ggplot(aes(x=reorder(film_title, -sd), y=sd, label=round(sd,2))) + 
  geom_bar(stat='identity', fill='red', alpha=.6) +
  geom_text(vjust=2, color='white') +
  ggtitle("Divided Opinions") +
  xlab('Film Title') +
  ylab('SD') +
  theme(axis.text.x = element_text(angle=45, hjust=1))


df_critics %>% 
  ggplot(aes(x=reorder(critic_name, -avg_score), y=avg_score, label=round(avg_score,1))) + 
  geom_bar(stat='identity', fill='purple', alpha=.6) +
  geom_text(vjust=2, color='white') +
  ggtitle("Toughest Critics") +
  xlab('Critic Name') +
  ylab('Avg Score') +
  theme(axis.text.x = element_text(angle=45, hjust=1))


