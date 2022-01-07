# Week Seven - Web Technologies; MongoDB [4-Oct 10-Oct]

 

- ### Week 7 Overview

  Over the next three weeks, we'll learn how to pull less-structured data from the web.  This week, we focus on the standard formats for web data:  HTML, XML, and JSON.  We'll also look some more at string manipulation functions and regular expressions.

  There is also an optional module on MongoDB.

  **Events and Deliverables**

  | Wednesday               | Meetup, 6:45 p.m. ET          |
  | ----------------------- | ----------------------------- |
  | Wednesday               | Discussion post due           |
  | Sunday                  | Discussion response due       |
  | Sunday                  | Week 7 Assignment due         |
  | Sunday                  | First part of PROJECT 3 DUE   |
  | Next Sunday             | Coding part of PROJECT 3 DUE  |
  | The following Wednesday | PROJECT 3 GROUP PRESENTATIONS |



- ### Web Data in R

  Attached Files:

  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) Web Data.pdf](https://bbhosted.cuny.edu/bbcswebdav/pid-59525149-dt-content-rid-462120032_1/xid-462120032_1) (131.577 KB) 

  Over the next three weeks, we begin our forays into working with unstructured data.  This week we'll focus on standard structures for web data and how to manipulate strings.  Next week is about scraping web pages.  In the following class week, we'll access web data through APIs.

  

  One interesting description of the difference between a data analyst and a data scientist is that a data analyst is good at working with structured  data (e.g. SQL and CSV formats), while a data scientist is comfortable with both structured and unstructured data.  For the remainder of this course, we'll be working with less structured data.



- ### Week 7 Core Reading

  Please read:

  - *Automated Data Collection with R*, chapters 2, 3 and 5.
  - *Data Science for Business*, Chapter 1.

  Here are some additional resources that you may find helpful.

  - See the links under "Getting Data from the Web with R"  on the page [Gaston Sanchez](http://gastonsanchez.com/teaching/).  These eight slide decks provide a lot of good basic knowledge for the material that we'll cover over the next three weeks.  In particular, decks 3, 4, and 5 are excellent background for this week's material on working with HTML, XML, and JSON.

  ![getting data from the web with R](https://bbhosted.cuny.edu/bbcswebdav/pid-59525150-dt-content-rid-462118990_1/xid-462118990_1)

  

  - [Handling and Processing Strings in R](http://gastonsanchez.com/blog/resources/how-to/2013/09/22/Handling-and-Processing-Strings-in-R.html), Gaston Sanchez, Includes link to freely downloadable (113 pp.!) eBook with good material on base R and stringr package string manipulation and grep.
  - If you are new to HTML, XML and JSON, and HTTP technologies, you may want to go through one of the many good on-line tutorials.  For example, here are w3schools.com's [introduction to JSON](https://www.w3schools.com/js/js_json_intro.asp), and to [XPath.](https://www.w3schools.com/xml/xpath_intro.asp)

---

- ### [MongoDB [OPTIONAL\]](https://bbhosted.cuny.edu/webapps/blackboard/content/listContent.jsp?course_id=_2010109_1&content_id=_59525151_1)

  In this folder, you'll find some additional information on using MongoDB, a very popular "NoSQL" database that is well-suited for working with JSON (and other) data.

  While there are no graded assignment on this material, you will have the option later in later course projects of reading data from data that you've stored in MongoDB document databases. 

  *This material was "downgraded" from required to recommended in order to allow more coverage of working with data in the Apache Spark environment later in the course.*



- ### Overview

  In this optional module, we'll introduce "NoSQL" databases, and look at working with unstructured data in MongoDB.



- ### Getting Started with MongoDB

  Here are instructions for installing and getting started with MongoDB:

  - [MongoDB Installation](http://docs.mongodb.org/manual/installation/) 
  - [MongoDB Getting Started](http://docs.mongodb.org/manual/tutorial/getting-started/)

  Here are three handy references for using MongoDB:

  1. [MongoDB reference cards](https://www.mongodb.com/lp/misc/quick-reference-cards) (you need to fill out form with your contact information)
  2. [SQL to MongoDB Mapping Chart ](https://docs.mongodb.org/manual/reference/sql-comparison/)
  3. [MongoDB cheat sheet](https://blog.codecentric.de/files/2012/12/MongoDB-CheatSheet-v1_0.pdf) (earlier version)

  Step by step MongoDB installation on Windows: https://www.guru99.com/installation-configuration-mongodb.html

  Step by step MongoDB installation on Mac: https://www.youtube.com/watch?v=DX15WbKidXY



- ### Loading data into a mongodb database

  The **mongoimport** command line utility lets you bulk-load information (e.g. from a json or csv file) into a mongodb database.  A description of how to use **mongoimport** is provided [here](http://docs.mongodb.org/manual/reference/program/mongoimport/#bin.mongoimport).

  If you want, you can practice using mongodb to import a file containing all of the U.S. zip codes, that is referenced [here](http://docs.mongodb.org/manual/tutorial/aggregation-zip-code-data-set/).



- ### R and MongoDB

  The most popular R package to work with MongoDB at this point in time seems to be rmongodb.  [RMongo is also well-regarded].

  [Here is some sample code ](https://gist.github.com/Btibert3/7751989)to get started with rmongodb:



- ### Optional: A graphical user interface for MongoDB admin?

  If you want to try out an "Admin UI" for MongoDB (like MySQL WorkBench provides for MySQL), mongodb.org maintains a list [here](http://docs.mongodb.org/ecosystem/tools/administration-interfaces/).  Many of these tools are single platform, commercial, and/or require installation of additional software (such as .NET or a PHP server).

   

- ### [Optional: NoSQL Introductory Videos](https://bbhosted.cuny.edu/webapps/blackboard/content/listContent.jsp?course_id=_2010109_1&content_id=_59525161_1)

  Here are two instructional videos from Mike Schulte that introduce NoSQL and Document Databases.



- ### [sample course tracker data from Daniel Watrous](https://bbhosted.cuny.edu/bbcswebdav/pid-59525162-dt-content-rid-462120043_1/xid-462120043_1)



- ### TO CONSIDER: Code First?

  When software developers build out applications from requirements, they often start with either the user interface design or the database design. Recently, many developers have adopted “schema-less” databases like MongoDB. Choosing MongoDB means that the developer could postpone designing a database schema, or in some cases, do away entirely with a fixed schema. 

  ***What are the advantages and disadvantages of a “code first” vs. “data first” design methodology?*** 

  Give specific examples, considering factors like how business logic is handled, and the number of different applications that work with the given data.



---



- ### [Discussion 7: Changing Web APIs](https://bbhosted.cuny.edu/webapps/blackboard/content/launchLink.jsp?course_id=_2010109_1&content_id=_59525152_1&mode=view)

  Please download and read:

  - Deepa Seetharaman and Elizabeth Dwoskin, *Wall Street Journal*, (2015): [Facebook’s Restrictions on User Data Cast a Long Shadow](https://www.dropbox.com/s/mssls6pdsz9gi74/Facebook’s Restrictions on User Data Cast a Long Shadow - WSJ.pdf?dl=0)

  A considerable amount of the material on the most popular APIs from Facebook, LinkedIn, and other "social media" sites has been either removed or deprecated. New sources of APIs are also constantly emerging. 

  Give an example of where access to web-based data has changed (increased or decreased) over time, whether due to changes in corporate objectives or in the regulatory environment. Who was impacted (positively or negatively) by these changes? What implications if any are there from the standpoint of being able to use this data in downstream analysis and/or product development?

  *Please make your initial post by Wednesday, and respond to at least one class mate's post by end of day on Sunday.*



- ### [Week 7 Assignment](https://bbhosted.cuny.edu/webapps/assignment/uploadAssignment?content_id=_59525153_1&course_id=_2010109_1&group_id=&mode=view)

  Attached Files:

  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) Assignment - Working with XML and JSON in R.pdf](https://bbhosted.cuny.edu/bbcswebdav/pid-59525153-dt-content-rid-462120042_1/xid-462120042_1) (103.538 KB) 

  This is a warm up exercise to help you to get more familiar with the HTML, XML, and JSON file formats, and using packages to read these data formats for downstream use in R data frames. In the next two class weeks, we’ll be loading these file formats from the web, using web scraping and web APIs.



- ### Project 3 - Most Valued Data Science Skills

  Review the project details and instructions under "Assignments"