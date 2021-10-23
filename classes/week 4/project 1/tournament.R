library(tidyverse)


## create players df

df <- read_delim('tournamentinfo.txt', delim='|',skip=1, trim_ws=TRUE) # load

df_players <- select(df,1:2) %>% filter(!is.na(df['Player Name'])) %>% filter(Pair!='Num') # cleanup

df_player1 <- filter(df_players,row_number() %% 2 == 1) # separate even and odd rows
df_player2 <- filter(df_players,row_number() %% 2 == 0)

df_players <- bind_cols(df_player1, df_player2) # bind columns

names(df_players) <- c('player_id','name','state','player_info') # rename multiple columns

df_players<- mutate(df_players, pre_rating = as.numeric(str_extract(player_info,'(?<=: ).{4}'))) # extract the players pre-rating

df_players <- mutate(df_players, player_id = as.numeric(player_id)) # convert to numeric

df_players <- select(df_players,!player_info) # cleanup


## create matches df

df_matches <- filter(df, !is.na(as.numeric(df$Pair))) # only keep rows with a numeric value in first column

df_matches <- select(df_matches,1,4:10) # drop extra cols

names(df_matches) <- c('player_id','1','2','3','4','5','6','7') # rename multiple columns

df_matches <- pivot_longer(df_matches,!player_id, names_to='round', values_to='match_info') # pivot

df_matches <- mutate(df_matches, outcome=str_sub(match_info,1,1), opponent_id=str_sub(match_info,str_length(match_info)-1)) # break out outcome and opponent id

df_matches <- filter(df_matches, outcome == 'W' | outcome =='L' | outcome == 'D') # keep only wins, losses and draws

df_matches <- mutate(df_matches, match_points = ifelse(outcome == 'W', 1, ifelse(outcome == 'D', 0.5, 0)))  # calculate points

df_matches <- mutate(df_matches, player_id = as.numeric(player_id), opponent_id = as.numeric(opponent_id)) # convert to numeric

df_matches <- select(df_matches,!match_info) # drop extra cols

df_matches <- left_join(df_matches, df_players[c('player_id','pre_rating')], by = c('opponent_id' = 'player_id')) # join opponent scores

df_matches <- rename(df_matches, opponent_pre_rating = pre_rating)


## fun time

df_player_scores <- df_matches %>% 
  group_by(player_id) %>% 
  summarize(total_points=sum(match_points), avg_opponent_pre_rating=round(mean(opponent_pre_rating))) %>%
  arrange(player_id)

df_final <- left_join(df_players, df_player_scores, by='player_id')

df_final <- relocate(df_final, total_points, .after=state) # rearrange column order

# From the cross-tables, choose only the player’s opponents and average pre-rating of their opponents, both for players who played all of the scheduled games (8 points), and for players who had one or more unplayed games (e.g. byes, forfeits). (5 points).

df_matches_played <- df_matches %>% 
  group_by(player_id) %>%
  summarize(num_matches = n())









