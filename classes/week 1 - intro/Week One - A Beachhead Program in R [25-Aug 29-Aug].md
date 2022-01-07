# Week One - A Beachhead Program in R [25-Aug 29-Aug]

 

## 

- 

  ### Course Overview

  

- 

  ### Week 1 Overview

  This week, we'll start working with R. You're asked to write a small "beachhead" program that subsets data. This will allow you to focus on getting your environment--R, RStudio, GitHub, and rpubs.com--set up.

  **Events and Deliverables**

  | Wednesday | Meetup, 6:45 p.m. ET                   |
  | --------- | -------------------------------------- |
  | Wednesday | Introduce yourself on discussion forum |
  | Wednesday | Week 1 discussion post due             |
  | Sunday    | Week 1 discussion response due         |
  | Sunday    | Week 1 assignment due                  |

  

  Here is what you should do to get started:

  - Read the syllabus.
  - Go through the course overview materials, and complete the week 1 readings.
  - Download, install, and configure R, then RStudio.
  - Sign up for a (free) rpubs.com account.
  - Sign up for a (free) GitHub account.
  - Introduce yourself on the course discussion forum.
  - Make your post and respond to at least one classmate's post for the week 1 discussion on proxy measures.
  - Use the provided [Doodle link](https://doodle.com/poll/inakz9m4vams7wqd?utm_source=poll&utm_medium=link) to sign up for a date and time to make your Data Science in Context presentation.
  - Join our Slack channel: https://join.slack.com/t/sps-b9z2581/shared_invite/zt-u79ee3xf-wqkV3fmQa2ZS~rU8PGXpLw
  - Go through this week's reading assignment.
  - Attend our first meetup on Wednesday at 6:45 p.m. ET. You'll find the Zoom link under the left hand "Meetups" menu item.
  - Preview assignment 1. If you don't find it straightforward, go through the optional, ungraded hands-on lab, and compare your solution to some of the provided solutions.  You'll learn best if you invest the time in first attempting a full solution yourself.
  - Complete assignment 1.

- 

  ### Week 1 Reading

  - *R for Data Science*, https://r4ds.had.co.nz/ chapters 1, 2, 3, 4, 6, 11, 17-21, 26, 27, 29, 30
  - Go through Vishal Patel's slideshare deck on [*Exploring the Data Science Process*](https://www.slideshare.net/VishalPatel321/the-data-science-process-87047657).
  - This (>90 second) outtake from an Amazon Web Services talk on their automated machine learning offering nicely describes machine learning's business drivers and challenges to adoption: https://www.youtube.com/embed/kou1gQmSmCU?start=103&end=189. We will look at Data Robot's and AWS's SageMaker Studio automl platforms in Week 15.

  Please note that while there is a lot of suggested reading throughout the semester, much of it is optional. The core text which you should read cover to cover is *R for Data Science*.  You are encouraged but not required to read the material in *Feature Engineering and Selection: A Practical Approach for Predictive Models* and in *Data Science for Business*. As an incentive for doing the extra reading, there will be occasional extra credit (in total, 3%) multiple choice quizzes on the optional reading assignments throughout the semester. 

- 

  ### Data Science Ethics

  Our work as data scientists can have a profound impact on creating and amplifying both bias and polarization.  We'll look at examples of both in our first meetup.

  ![Weapons of Math Destruction cover image](https://bbhosted.cuny.edu/bbcswebdav/pid-59864355-dt-content-rid-462473791_1/xid-462473791_1)

  

  

- 

  ### R Markdown

  R Markdown enables reproducible research.

  - R Markdown Cookbook is [freely available](https://bookdown.org/yihui/rmarkdown-cookbook/)
  - RStudio offers some [interactive lessons](https://rmarkdown.rstudio.com/lesson-1.html) for R Markdown
  - [R Markdown Cheat Sheet](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf)

  ![R Markdown Cookbook cover image](https://bbhosted.cuny.edu/bbcswebdav/pid-59864209-dt-content-rid-462473788_1/xid-462473788_1)

  

- 

  ### GitHub

  GitHub is the leading tool for collaborative, web-based version control. You're asked to submit all of your assignments into a GitHub repo(sitory). In your Tidyverse Extend assignment, on your team project (project 3), and on other projects and assignments where you opt to work in teams, you'll find the ability to share code with GitHub to be very helpful. Some data scientist employers will even ask job candidates to provide links to their portfolio of projects in GitHub!

  There are different ways to work with GitHub:

  - **GitHub Desktop**. The fastest way to get started is probably to download GitHub desktop to your PC or Mac.  You'll do some of your work in GitHub desktop, and other work in your web browser. *We'll walk through how to submit an assignment using GitHub desktop in our first meetup.*
  - **RStudio Integration**. R and RStudio provide a number of ways to integrate GitHub version control into your R notebooks. Jenny Bryan's https://happygitwithr.com/ is an outstanding resource. RStudio also provides extensive documentation, e.g. https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN
  - **Command Line Git**. Most data scientists--and arguably all data engineers--are competent with working with git from the command line. This has the steepest learning curve, but provides the most functionality, and usually the best performance. While the surface area git is huge, most command line work can be done by learning how to use a half-dozen command options.

- 

  ### Subsetting Data

  A data scientist needs to be able to work with structured, semi-structured, and unstructured datasets. 

  - **Structured data** is rectangular. Common examples are .CSV files and SQL result sets.
  - **Semi-Structured data** includes JSON pulled from an API query and HTML from scraping a web page.
  - **Unstructured data** includes text, audio, and video.

  In your Week 1 assignment, you'll be asked to write an R program that reads a .CSV file into an R data.frame, then subsets the data. That is, you'll perform filtering operations that restrict the rows and columns in a rectangular dataset. For people with a background in SQL, this is like restricting the columns returned from a table with a SELECT column list, and restricting the rows returned with a WHERE clause.  In Week 2, we'll learn how to work with SQL code inside of an R program.

  There are a number of different approaches to subsetting data in an R data.frame.  You're welcome to use any approach you like in your assignments, unless specified otherwise.

  - You can write your subsetting code in "base R" without any additional packages.
  - You can use Tidyverse packages like dplyr to filter your data. In this course, we'll show a strong bias for using Tidyverse packages, since these have become somewhat of an industry standard.
  - You can use a different R package, like data.table.

  **Additional resources on subsetting data.frames**

  Our course text *R for Data Science* explains how to read data from a .CSV file into an R data.frame. If you want more information on using Tidyverse's related capabilities, you may find it helpful to go through the first two interactive tutorials at RStudio Primer here: https://rstudio.cloud/learn/primers 

  If you are very new to R--especially if you missed the R bridge course offered before this semester--you may find it helpful to start with the more gentle explanations on working with R offered in *Hands-On Programming with R: Write Your Own Functions and Simulations*, available here: https://rstudio-education.github.io/hopr/

  ![R Studio primer home page image](https://bbhosted.cuny.edu/bbcswebdav/pid-59870868-dt-content-rid-462484987_1/xid-462484987_1)

   

  

  

- 

  ### Hands on Lab: Subsetting Datasets

  Attached Files:

  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) Hands On Lab Subsetting Datasets.pdf](https://bbhosted.cuny.edu/bbcswebdav/pid-59525228-dt-content-rid-462120056_1/xid-462120056_1) (316.892 KB) 

  This is an ungraded assignment to give you practice subsetting data in R.  There's nothing to turn in.  You are strongly encouraged to attempt the assignment before looking at the four provided solutions for the assigned dataset from previous DATA 607 students:

  - Armenoush Aslanian-Persico (2016): [607 Homework 1](http://rpubs.com/aapsps/151233), Good use of guiding questions.
  - Asher Meyers (2016): [Bridges Subsetting for DATA 607 Week 2](http://rpubs.com/ashernm/Week2_Subsetting), Nice use of graphs to explore relationships in bridges dataset.
  - Robert Sellers (2016): [607_Week2_Assignment](http://rpubs.com/robertwsellers/IS607_Homework2), Impressively minimalist solution.
  - Chirag Vithalani (2016): [607_Week2Assignment](http://rpubs.com/chirag/Week2-607), Dynamically reads dictionary. 

  Here are three other example solutions, where the students chose to work with different datasets. 

  - Keith Folsom (2016): [DATA 607 Week 2 Assignment - Subsetting Datasets](http://rpubs.com/kfolsom98/151115), Online news popularity dataset. Nice layout; uses lubridate package; converts dummy variables to categorical variable.
  - Christophe Hunt (2016): [Week 2 - Subsetting Data w/R](http://rpubs.com/Christophe1/151099), Flag database; nice use of mapvalues() and htmlTable library.
  - Christopher Martin (2016): [Subsetting the Automobiles Data Set](http://rpubs.com/chrisgmartin/150407), Automobiles.

  ***Please note that for most of the actual class assignments, you have the option of substituting your own dataset. If I have not explicitly stated that alternate datasets are OK for a specific assignment, please just run your proposed plan by me in advance, in a brief e-mail.*** 

- 

  ### [Introduce Yourself](https://bbhosted.cuny.edu/webapps/blackboard/content/launchLink.jsp?course_id=_2010109_1&content_id=_59525227_1&mode=view)

  Please create a new thread with your name in the subject and answer the following items:

  - Share with us who you are and where you're from.
  - Share a brief story about data that you have worked with or want to work with.
  - What (else!) do you do for fun?

  *Please post this information if possible before our first meetup on Wednesday, but no later than end of day on Sunday.**
  *

- 

  ### [DIscussion 1: Proxy Measures](https://bbhosted.cuny.edu/webapps/blackboard/content/launchLink.jsp?course_id=_2010109_1&content_id=_59525229_1&mode=view)

  First, please read this article, where David Wasserman argues that living near either a Whole Foods grocery store or a Cracker Barrel restaurant serves as a reliable proxy for the aggregated cultural attitudes (and voting patterns) for nearby people. 

  - David Wasserman (2014): [Senate Control Could Come Down To Whole Foods vs. Cracker Barrel](http://fivethirtyeight.com/features/senate-control-could-come-down-to-whole-foods-vs-cracker-barrel/).

  Can you give an example where proxy measures have been used — or could be used.  In your example, what are the advantages and/or disadvantages of using proxy measures? Would this be an effective and appropriate use?  

  
  *Please make your initial post before our meetup on Wednesday, and respond to at least one classmate’s post before end of day on Friday.*

- 

  ### [Week 1 Assignment](https://bbhosted.cuny.edu/webapps/assignment/uploadAssignment?content_id=_59525230_1&course_id=_2010109_1&group_id=&mode=view)

  Attached Files:

  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) Assignment Basic Loading and Transformation.pdf](https://bbhosted.cuny.edu/bbcswebdav/pid-59525230-dt-content-rid-462120058_1/xid-462120058_1) (305.898 KB) 

  Your week 1 assignment is due end of day on Sunday.