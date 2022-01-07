# Week 10 - Natural Language Processing [25-Oct 31-Oct]

 

- ### Overview

  This week, we'll look at text processing.  

  **Events and Deliverables**

  | Wednesday | Meetup, 6:45 p.m. ET    |
  | --------- | ----------------------- |
  | Wednesday | Discussion post due     |
  | Sunday    | Discussion response due |
  | Sunday    | Assignment 10 due       |

  

  This week's material also helps prepare you for success on Project 4, where you'll be asked to build models!



- ### Reading

  Please read *Automated Data Collection with R*, Chapter 10.  

  Some of the code in chapter 10 has changed since early printings of the text book. The authors have been keeping the code updated to reflect changes in packages in the errata that is available on line.  There is also a good related case study covered "soup-to-nuts" in Chapter 17.

  In addition to the tm package, the qdap package offers some rich functionality for text processing.

  ![text mining with R ](https://bbhosted.cuny.edu/bbcswebdav/pid-59525130-dt-content-rid-462118981_1/xid-462118981_1)

  

  *tidytext* is a new package that seeks to offer a "tidyverse" implementation of text processing. *tidytext* is well documented in the on-line [Text Mining with R](http://tidytextmining.com/) and in Julia Silge's rstudio conference video on [Text Mining the tidy Way.](https://www.rstudio.com/resources/videos/text-mining-the-tidy-way/) 



- ### Sentiment Analysis

  This 10 minute video provides a 10,000 foot view of sentiment analysis. 

  [![img](http://i.ytimg.com/vi/ytUHvMNnzZk/1.jpg)Watch Video ](http://www.youtube.com/watch?v=ytUHvMNnzZk)

  Machine Learning Lecture 2: Sentiment Analysis (text classification) 

  **Duration:** 9:47 
  **User:** n/a - **Added:** 5/19/11 

  **YouTube URL:** http://www.youtube.com/watch?v=ytUHvMNnzZk



- ### Additional Reading (very optional)

  *Natural Language Processing with Python* is an excellent Python-based text that does a deep dive on text processing.  There is a version of this text (updated for Python 3 and NLTK 3) [here.](http://www.nltk.org/book/ch03.html) 

  

  ![NLP pipeline](https://bbhosted.cuny.edu/bbcswebdav/pid-59525132-dt-content-rid-462118982_1/xid-462118982_1)

  

  

  Natural Language Processing pipeline.  Source:  *Natural Language Processing with Python*, chapter 3.



- ### [Discussion 10: Sentiment Analysis Value Drivers](https://bbhosted.cuny.edu/webapps/blackboard/content/launchLink.jsp?course_id=_2010109_1&content_id=_59525133_1&mode=view)

  Please find and cite a specific code-based example on the web that describes how sentiment analysis has created value (e.g. business value or social good). You should briefly synopsize

  1. The (business) domain under discussion
  2. the problem that sentiment analysis addresses
  3. the approach used, then
  4. describe if possible a different domain where the same approach might also be effective.

  Here is an example of what I mean by a code-based example on sentiment analysis: [Using sentiment analysis to predict ratings of popular tv series](http://www.r-bloggers.com/using-sentiment-analysis-to-predict-ratings-of-popular-tv-series/)

  *
  Make your post by Wednesday.  Please respond to at least one of your classmates' posts by end of day on Sunday.* 



- ### [Week 10 Assignment](https://bbhosted.cuny.edu/webapps/assignment/uploadAssignment?content_id=_59525134_1&course_id=_2010109_1&group_id=&mode=view)

  Attached Files:

  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) Week 10 Assignment Rubric.pdf](https://bbhosted.cuny.edu/bbcswebdav/pid-59525134-dt-content-rid-462120044_1/xid-462120044_1) (45.194 KB) 

  In *Text Mining with R*, [Chapter 2 looks at *Sentiment Analysis*](https://www.tidytextmining.com/sentiment.html). In this assignment, you should start by getting the primary example code from chapter 2 working in an R Markdown document. You should provide a citation to this base code. You’re then asked to extend the code in two ways:

  - Work with a different corpus of your choosing, and
  - Incorporate at least one additional sentiment lexicon (possibly from another R package that you’ve found through research).

  As usual, please submit links to both an .Rmd file posted in your GitHub repository and to your code on rpubs.com. You make work on a small team on this assignment.