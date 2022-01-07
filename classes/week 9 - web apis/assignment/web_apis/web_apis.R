library(tidyverse)
library(rvest)
library(tidyjson)
library(configr)


# get app_key from config file, set up url
cfg <- read.config(file = 'config.yml')
api_endpoint <- 'https://api.nytimes.com/svc/news/v3/content/all/all.json'
api_url <- str_c(api_endpoint,'?api-key=',cfg$app_key)

# call api
html <- read_html(api_url)
json <- html %>% html_elements("body") %>% html_text()

# examine structure
json %>% gather_object %>% json_types

# 'results' is an array, enter it using enter_object and gather_array
# using spread_values individually instead of spread_all ..  
# some of the fields (such as des_facet) don't exist in all entries
results<- json %>% 
  enter_object('results') %>% 
  gather_array %>% 
  spread_values(
    section = jstring(section),
    title = jstring(title),
    byline = jstring(byline),
    abstract = jstring(abstract),
    created_date = jstring(created_date)
  ) %>%
  select(!c(document.id, array.index))

results_df <- results %>% as_data_frame.tbl_json()

results_df


results
