library(tidyverse)
library(fivethirtyeight)

# 1. Using the 173 majors listed in fivethirtyeight.com’s College Majors dataset [https://fivethirtyeight.com/features/the-economic-guide-to-picking-a-college-major/], provide code that identifies the majors that contain either "DATA" or "STATISTICS"

data("college_all_ages")
df <- college_all_ages
str_subset((df$major),regex("DATA|STATISTICS", ignore_case=TRUE))

# 2. Write code that transforms the data below:

```
[1] "bell pepper"  "bilberry"     "blackberry"   "blood orange"
[5] "blueberry"    "cantaloupe"   "chili pepper" "cloudberry"  
[9] "elderberry"   "lime"         "lychee"       "mulberry"    
[13] "olive"        "salal berry"
```

Into a format like this:
  
  ```
c("bell pepper", "bilberry", "blackberry", "blood orange", "blueberry", "cantaloupe", "chili pepper", "cloudberry", "elderberry", "lime", "lychee", "mulberry", "olive", "salal berry")
```


# 3. Describe, in words, what these expressions will match:


(.)\1\1
#nothing - no quotes, single backslash only

"(.)(.)\\2\\1"
# the first case where two single characters appear in order, and immediately again in reverse order.  ('abba')

s <- "abba"
str_view(s, "(.)(.)\\2\\1")



(..)\1
#nothing - no quotes, single backslash only


"(.).\\1.\\1"
# the first case where a single character appears three times with any other character in between. ('abaca')

s <- "abaca"
str_view(s, "(.).\\1.\\1")


"(.)(.)(.).*\\3\\2\\1"
# the first case where a sequence of three characters appear again in reverse order, with any single character in between.  ('abcZcba')

s <- "abcZcba"
str_view(s, "(.)(.)(.).*\\3\\2\\1")


4. Construct regular expressions to match words that:

* Start and end with the same character.

s <- c('goat','llama','alpaca')
str_match(s, "^(.).*\\1$")

* Contain a repeated pair of letters (e.g. "church" contains "ch" repeated twice.)

s <- c('hall','lurch','church')
str_match(s,"^.*(..).*\\1.*$")

* Contain one letter repeated in at least three places (e.g. "eleven" contains three "e"s.)

s <- c('ten','eleven','alpaca')
str_match(s, "^.*(.).*\\1.*\\1.*$")






berries <- '[1] "bell pepper"  "bilberry"     "blackberry"   "blood orange"
[5] "blueberry"    "cantaloupe"   "chili pepper" "cloudberry"  
[9] "elderberry"   "lime"         "lychee"       "mulberry"    
[13] "olive"        "salal berry"'

berries
writeLines(berries)
str_length(berries) # single string with 225 characters

# str_view_all(str_squish(berries),'(?<=")([:alpha:]|[:space:]){2,}(?=")')

s <- str_extract_all(str_squish(berries),'(?<=")([:alpha:]|[:space:]){2,}(?=")')

u <- str_c(s, sep='"')
writeLines(u)
