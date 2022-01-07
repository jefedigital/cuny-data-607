# Week Four - Exploratory Data Analysis; Data Imputation [13-Sep 19-Sep]

 

## 

- 

  ### Week 4 Overview

  This week, we'll look at using R's graphics capabilities to perform exploratory data analysis.  

  **Events and Deliverables**

  | Wednesday | Meetup 6:45 pm ET       |
  | --------- | ----------------------- |
  | Wednesday | Discussion Post due     |
  | Sunday    | Discussion Response due |
  | Sunday    | Project 1 due           |

- 

  ### Week 4 Learning Outcomes

  You should be able to:

  - Describe the core graphics and functions to perform exploratory data analysis on one or two data frame variables.
  - Generate basic descriptive statistics, using the base R table() and summary() functions.
  - Create graphics to describe a single numeric or categorical variable.
  - Create graphics to show the relationship between two numeric variables.
  - Identify and reasonably handle outliers and missing data.

- 

  ### Week 4 Core Reading

  Please read:

  - ***R for Data Science\*, https://r4ds.had.co.nz/ chapter 3 (review), 7, and 28**
  - *FES*, [http://www.feat.engineering/](https://r4ds.had.co.nz/), ch 8

  The R for Data Science readings are core. The other reading assignments this week are optional. There will be occasional, extra-credit quizzes on the optional reading assignments.

  Here are some additional resources that you may find helpful.

  **Web-Based Applications**

  Hadley Wickham's 2021 book on Shiny can be found here: https://mastering-shiny.org/.  The work of many data scientists includes building dashboards and scorecards for organizations.

  **Graphics for Exploratory Data Analysis:**

  -  Slawa Rokicki (2012): [Basics of Histograms](http://rforpublichealth.blogspot.com/2012/12/basics-of-histograms.html)
  -  Fabio Veronesi (2013): [Box-plot with R – Tutorial ](http://r-video-tutorial.blogspot.com/2013/06/box-plot-with-r-tutorial.html)
  -  [Scatterplots](http://www.statmethods.net/graphs/scatterplot.html)

  ***Additional Practice (optional)***

  Here are three DataCamp courses related to this week's material:

  - [Introduction to Data Visualization with ggplot2](https://www.datacamp.com/courses/introduction-to-data-visualization-with-ggplot2)
  - [Anomaly Detection in R](https://www.datacamp.com/courses/anomaly-detection-in-r)
  - [Dealing with Missing Data in R](https://www.datacamp.com/courses/dealing-with-missing-data-in-r) 

  ***Reference Information***

  The definitive reference documentation for ggplot2 can be found [here](http://docs.ggplot2.org/current/). My favorite book on R and Graphics is Winston Chang's [*R Graphics Cookbook*](http://www.amazon.com/R-Graphics-Cookbook-Winston-Chang/dp/1449316956).  This book focuses primarily on using the ggplot2 package.  See also his excellent support site [here](http://www.cookbook-r.com/Graphs/).

- 

  ### Hands On Lab: ggplot2

  Attached Files:

  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) HOL ggplot2.pdf](https://bbhosted.cuny.edu/bbcswebdav/pid-59525184-dt-content-rid-462120059_1/xid-462120059_1) (115.294 KB) 
  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) hol_ggplot2.Rmd](https://bbhosted.cuny.edu/bbcswebdav/pid-59525184-dt-content-rid-462120060_1/xid-462120060_1) (1.697 KB) 

  This ungraded hands on lab helps you build to your skills writing R code to generate descriptive statistics and basic graphics. Solutions to all problems are immediately available, but you’ll learn the material more *durably* if you attempt each problem before consulting its solution. 

  1. Load the diamonds dataset, which is included with the ggplot2 package. Identify which variables in the diamond set are numeric, and which are categorical (factors).
  2. Generate summary level descriptive statistics: Show the mean, median, 25th and 75th quartiles, min, and max for each of the applicable variables in diamonds.
  3. Determine the frequency for each of the diamond colors.
  4. Determine the frequency for each of the diamond cuts, by color
  5. Create a graph for a single numeric variable.
  6. Create a scatterplot of two numeric variables.

  The R Markdown file with the solution code is attached.  You can also see the published code [here](http://rpubs.com/catlin/DPBWeek6). 

- 

  ### [Discussion 4: Bright Spots](https://bbhosted.cuny.edu/webapps/blackboard/content/launchLink.jsp?course_id=_2010109_1&content_id=_59525185_1&mode=view)

  Please read this article about how focusing on “bright spots” can be an effective strategy for implementing change.

  
  Chip Heath and Dan Heath (2010): [Switch: Don’t Solve Problems–Copy Success](https://www.fastcompany.com/1514493/switch-dont-solve-problems-copy-success)

  
  Please describe an example of where data has helped (or might help) to uncover a “bright spot” which could be replicated.  This could be for any kind of improvement, from social good to business profitability. 

  

- 

  ### Project 1

  Project 1 is due end of day on Sunday.  The project 1 details and submission link can be found in "Major Assignments".