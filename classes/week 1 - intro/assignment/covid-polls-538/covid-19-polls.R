library(tidyverse)
library(lubridate)

# load data
polls_adjusted <- read_csv('data/covid_approval_polls_adjusted.csv')
df <- select(polls_adjusted, !c(modeldate,multiversions,tracking,timestamp,url))

# rename variables
df <- rename(df, poll_start = startdate)
df <- rename(df, poll_end = enddate)
df <- rename(df, sample_size = samplesize)
df <- rename(df, poll_weight = weight)
df <- rename(df, poll_influence = influence)

# fix datatypes
ctypes <- c('ffcccfdfdddddd')
df <- type_convert(df, col_types=ctypes)

# fix date separately
df$poll_start <- parse_date(df$poll_start,'%m/%d/%Y')
df$poll_end <- parse_date(df$poll_end,'%m/%d/%Y')

## fix error in population ..'v' is a data error
levels(df$population)[4] <- levels(df$population)[2] # assign v to rv
levels(df$population) <- c('unregistered','registered voter','likely voter')

df <- mutate(df, registered_voter = ifelse(population == 'unregistered', FALSE, TRUE))
df <- mutate(df, likely_voter = ifelse(population == 'likely voter', TRUE, FALSE))

# check
str(df)

### EDA

# count of polls
nrow(unique(df[,c('poll_end','pollster')])) # 783

# count of pollsters
length(unique(df$pollster)) #54

# date range
range(df$poll_start) # 2020-02-02
range(df$poll_end) # 2021-08-24

write_csv(df, 'report/df.csv')

###

# Measures of overall spread -- inconclusive, they move pretty much together.

# approval - spread

df_spread_approve <- select(df, c(party,poll_end,approve_adjusted))

df_spread_approve <- df_spread_approve %>% mutate(poll_week=floor_date(poll_end, unit='week')) # get week of end_date

df_spread_approve <- df_spread_approve %>% group_by(party, poll_week) %>% summarize(avg_approval=mean(approve_adjusted)) # summarize

df_spread_approve <- df_spread_approve %>% pivot_wider(names_from=party, values_from=avg_approval) 

df_spread_approve <- df_spread_approve %>% mutate(di_approve = abs(D-I),dr_approve = abs(D-R),ir_approve = abs(I-R))

write_csv(df_spread_approve, 'report/df_spread_approve.csv')

ggplot(df_spread_approve, aes(x=poll_week, y=dr_approve)) + geom_line(colour='blue') + scale_y_continuous(name = "Point Spread", limits = c(0, 100)) + ggtitle("Difference between D & R Approval ratings")



# disapproval - spread

df_spread_disapprove <- select(df, c(party,poll_end,disapprove_adjusted))

df_spread_disapprove <- df_spread_disapprove %>% mutate(poll_week=floor_date(poll_end, unit='week')) # get week of end_date

df_spread_disapprove <- df_spread_disapprove %>% group_by(party, poll_week) %>% summarize(avg_disapproval=mean(disapprove_adjusted)) # summarize

df_spread_disapprove <- df_spread_disapprove %>% pivot_wider(names_from=party, values_from=avg_disapproval)

df_spread_disapprove <- df_spread_disapprove %>% mutate(di_disapprove = abs(D-I),dr_disapprove = abs(D-R),ir_disapprove = abs(I-R))

write_csv(df_spread_disapprove, 'report/df_spread_disapprove.csv')

ggplot(df_spread_disapprove, aes(x=poll_week, y=dr_disapprove)) + geom_line(colour='blue') + scale_y_continuous(name = "Point Spread", limits = c(0, 100)) + ggtitle("Difference between D & R Disapproval ratings")



### Additional variables; voter registration and likelihood

df_approve_voter <- select(df, c(party,poll_end,approve_adjusted,disapprove_adjusted,registered_voter,likely_voter))

df_approve_voter <- df_approve_voter %>% mutate(poll_week=floor_date(poll_end, unit='week'))

df_approve_voter <- df_approve_voter %>% group_by(party, poll_week, registered_voter, likely_voter) %>% summarize(avg_approval=mean(approve_adjusted), avg_disapproval=mean(disapprove_adjusted))

write_csv(df_approve_voter, 'report/df_voters_approve.csv')


### Approval breakdowns

df_approve_voter %>%
  filter(party!='all') %>% 
  ggplot(aes(x=poll_week, y=avg_approval)) + 
  geom_line(aes(color=party)) + 
  scale_y_continuous(name = "Approval", limits = c(0, 100)) + 
  scale_color_manual(values = c('D'='blue', 'R'='red', 'I'='grey')) +
  ggtitle("Approval Rating - by Party")



df_approve_voter %>%
  filter(party=='all') %>% 
  ggplot(aes(x=poll_week, y=avg_approval)) + 
  geom_line(colour='green') + 
  scale_y_continuous(name = "Approval", limits = c(0, 100)) + 
  ggtitle("Approval Rating - All Reponses")

df_approve_voter %>%
  filter(party=='all') %>% 
  ggplot(aes(x=poll_week, y=avg_approval)) + 
  geom_line(aes(color=registered_voter)) + 
  scale_y_continuous(name = "Approval", limits = c(0, 100)) + 
  ggtitle("Approval Rating - All Reponses")

df_approve_voter %>%
  filter(party=='all') %>% 
  ggplot(aes(x=poll_week, y=avg_approval)) + 
  geom_line(aes(color=likely_voter)) + 
  scale_y_continuous(name = "Approval", limits = c(0, 100)) + 
  ggtitle("Approval Rating - All Reponses")


### Disapproval breakdowns

df_approve_voter %>%
  filter(party!='all') %>% 
  ggplot(aes(x=poll_week, y=avg_disapproval)) + 
  geom_line(aes(color=party)) + 
  scale_y_continuous(name = "Approval", limits = c(0, 100)) + 
  scale_color_manual(values = c('D'='blue', 'R'='red', 'I'='grey')) +
  ggtitle("Dispproval Rating - by Party")




df_approve_voter %>%
  filter(party=='all') %>% 
  ggplot(aes(x=poll_week, y=avg_disapproval)) + 
  geom_line(colour='red') + 
  scale_y_continuous(name = "Dispproval", limits = c(0, 100)) + 
  ggtitle("Dispproval Rating - All Reponses")

df_approve_voter %>%
  filter(party=='all') %>% 
  ggplot(aes(x=poll_week, y=avg_disapproval)) + 
  geom_line(aes(color=registered_voter)) + 
  scale_y_continuous(name = "Dispproval", limits = c(0, 100)) + 
  ggtitle("Dispproval Rating - All Reponses")

df_approve_voter %>%
  filter(party=='all') %>% 
  ggplot(aes(x=poll_week, y=avg_disapproval)) + 
  geom_line(aes(color=likely_voter)) + 
  scale_y_continuous(name = "Dispproval", limits = c(0, 100)) + 
  ggtitle("Dispproval Rating - All Reponses")
