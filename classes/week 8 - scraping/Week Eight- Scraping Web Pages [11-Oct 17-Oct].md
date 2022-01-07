# Week Eight- Scraping Web Pages [11-Oct 17-Oct]



- ### Overview

  This week, we'll learn how to scrape web pages.  

  **Events and Deliverables**

  | Wednesday      | Meetup, 6:45 p.m. EDT         |
  | -------------- | ----------------------------- |
  | Wednesday      | Discussion post due           |
  | Sunday         | Project 3 due                 |
  | Sunday         | Discussion response due       |
  | Next Wednesday | Project 3 group presentations |



- ### Web Scraping: Core Learning Materials

  Please do the following:

  **Read**:

  - Data Science for Business, chapter 8.
  - Automated Data Collection with R, chapter 9.

  

  **Watch**:

  Garrett Grolemund, Easy ways to collect different types of data from the web with R:

  - Part 1, https://rstudio.com/resources/webinars/part-1-easy-ways-to-collect-different-types-of-data-from-the-web-with-r/
  - Part 2, https://rstudio.com/resources/webinars/part-2-easy-ways-to-collect-different-types-of-data-from-the-web-with-r/

  ![basic rvest workflow](https://bbhosted.cuny.edu/bbcswebdav/pid-59525142-dt-content-rid-462118987_1/xid-462118987_1)

  

  Basic web scraping workflow using rvest.  You may want to start by using selectorGadget to identify the best CSS Selector for the data that you want to scrape.  
  Source: Garrett Grolemund, [Extracting data from the web: Part 2 Web Scraping](https://www.rstudio.com/resources/webinars/extracting-data-from-the-web-part-2/). Nov 2016. [39 minutes]

  

- ### Web Scraping: Optional Learning Materials

  Attached Files:

  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) RWebScraping.Rmd](https://bbhosted.cuny.edu/bbcswebdav/pid-59525143-dt-content-rid-462120031_1/xid-462120031_1) (3.106 KB) 

  Here is CRAN's curated list of the most important R packages for web technologies and services.

  [CRAN Task View: Web Technologies and Services.](http://cran.r-project.org/web/views/WebTechnologies.html)

  This is an earlier, shorter video with source code that I made on the same topics as covered by Garrett Grolemund above: 

  [![img](http://i.ytimg.com/vi/GxQLPNtJiMM/1.jpg)Watch Video ](http://www.youtube.com/watch?v=GxQLPNtJiMM)

  R Web Page Scraping 

  **Duration:** 4:49 
  **User:** n/a - **Added:** 10/19/14 

  **YouTube URL:** http://www.youtube.com/watch?v=GxQLPNtJiMM

   

  If you want to follow along with the video, you should first install the SelectorGadget extension into Google Chrome, from [SelectorGadget.com](http://selectorgadget.com/).

  The R code is in the attached R Markdown file; it can also be viewed on-line [here](http://rpubs.com/catlin/rvest).

  

- ### Ungraded Hands-On Lab: Web Scraping

  If you want some practice scraping web pages, consider the challenge of getting the National Football League Super Bowl results published [here](http://www.espn.com/nfl/superbowl/history/winners) into a data frame.

  ![Super Bowl results](https://bbhosted.cuny.edu/bbcswebdav/pid-59525144-dt-content-rid-462118988_1/xid-462118988_1)

  

  This task is reverse-engineered from an rvest example provided by David Radcliffe [here](https://rpubs.com/Radcliffe/superbowl).  If you want to run David's solution "as-is," please note that more Super Bowls have been played since he wrote his code.

  *You'll learn the material more deeply and more durably if you attempt the solution on your own before consulting the provided solution.*



- ### [Discussion 8: Web Data](https://bbhosted.cuny.edu/webapps/blackboard/content/launchLink.jsp?course_id=_2010109_1&content_id=_59525145_1&mode=view)

  **Data From the Web.** For this week’s discussion, please **identify a web page** (or set of web pages) **with some interesting data**. **Discuss the value of the data on the web page** (who would benefit from it, how would the data be used, and what are the benefits of its use(s)), and if there are **alternative ways to acquire the same data.** Also, discuss **how the data on the web page(s) that you have identified might compare to other sources of data,** in terms of time (timeliness of data, and time effort to obtain data), level of aggregation, data quality, legal issues, and costs (both in terms of acquisition cost of data, and cost to develop and maintain screen-scraping capabilities).



- ### PROJECT 3

  Project 3 is due end of day on Sunday.  You'll find the Project 3 requirements and submission link in "Major Assignments".