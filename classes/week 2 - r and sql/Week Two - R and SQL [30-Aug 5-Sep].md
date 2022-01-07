# Week Two - R and SQL [30-Aug 5-Sep]

 

## 

- 

  ### Week 2 Overview

  This week, we'll work on getting information from a relational database into R.

   **Events and Deliverables**

  | Wednesday | Week 2 discussion due          |
  | --------- | ------------------------------ |
  | Wednesday | Meetup, 6:45 p.m. ET           |
  | Friday    | Week 2 discussion response due |
  | Sunday    | Week 2 Assignment due          |

- 

  ### Week 2 Core Reading

  Please read:

  

  - ***R for Data Science\*, https://r4ds.had.co.nz/ chapter 8, 9, 10, 13**
  - *Automated Data Collection with R*, ch 7
  - *FES*, [http://www.feat.engineering/](https://r4ds.had.co.nz/), ch 1, 2

  The R for Data Science readings are core. The other reading assignments this week are optional. There will be occasional, extra-credit quizzes on the optional reading assignments.

  

- 

  ### Which SQL?

  You may use any relational database that you like for this week's assignment.

  According to[ DB-Engines](https://db-engines.com/en/ranking), the three most popular open source relational databases are MySQL, PostgreSQL, and SQLite.  

  In terms of job opportunities, an August 2021 search on Indeed.com for job postings in New York City yielded 1,197 MySQL jobs, 738 PostgreSQL jobs, and 27 SQLite jobs. PostgreSQL is (in my opinion) a better (more ANSI-SQL complete) implementation of SQL, and is favored among start-up developers that I'm familiar with. SQLite has the smallest footprint of the three, and is the easiest to stand up.  Developers that build analytic phone apps often choose SQLite.

  Data manipulation language (DML)--SELECT, INSERT, UPDATE, DELETE--is very similar across different implementations of SQL, with enough variation to be mildly annoying. Newer features like Window functions vary considerably in functionality across relational database implementations.

  Data definition language (DDL)--CREATING TABLES, loading data, etc. varies much more across different SQL implementations. Reading data from a large .CSV file into a PC or (especially) a Mac can be no picnic. MySQL is especially challenging here, and often requires modifying configuration files from the command line / terminal. You're encouraged to support each other via the Slack channel, and reach out to me if you can't get unstuck.

  For students who are already comfortable working with relational databases, I'd encourage you to stand up your relational database in the Cloud, using Amazon Web Services, Microsoft Azure, or Google Compute Platform. All three of the leading U.S.-based cloud platforms provide introductory credits or free-tier time, but you still need to be careful about not exceeding the offer limits.

- 

  ### Additional Resources for Learning SQL

  This course assumes that you have a solid understanding of basic SQL from either your work experience or CUNY's SQL Bridge workshop .  If you need a refresher, you may want to read a book like *The Language of SQL*.

  If you’re relatively new to SQL, you may find helpful the first three courses in DataCamp’s SQL Fundamentals track. Please send me an e-mail if you want free access to all the DataCamp courses for the duration of the semester:

  https://learn.datacamp.com/skill-tracks/sql-fundamentals

  You may find this additional information from Software Carpentry on [Databases and SQL](http://swcarpentry.github.io/sql-novice-survey/index.html) helpful, especially if you are relatively new to SQL.

  Software Carpentry has also put together eight short open source videos on using databases (using SQLite, which is similar to MySQL). Consider watching all of their database videos in order, found in this [YouTube playlist](https://www.youtube.com/playlist?list=PL3416DE5D2419D0D1).

  And you may find helpful this [SQL cheat sheet](http://www.sql-tutorial.net/sql-cheat-sheet.pdf).

  For students who want a more in-depth grounding on SQL, I'd recommend Stanford's (free) short course [here](https://lagunita.stanford.edu/courses/DB/SQL/SelfPaced/about).

  The Stanford course's [software guide](https://lagunita.stanford.edu/courses/DB/SQL/SelfPaced/a9ce7e86f39c4f8aa833215e22c02e20/) provides some additional guidance on installing MySQL, PostgreSQL, and SQLite on Macs and PCs.

  ![Stanford Database Course Software Guide](https://bbhosted.cuny.edu/bbcswebdav/pid-60569391-dt-content-rid-462118993_1/xid-462118993_1)

  

   

  

- 

  ### [MySQL](https://bbhosted.cuny.edu/webapps/blackboard/content/listContent.jsp?course_id=_2010109_1&content_id=_59525197_1)

- 

  ### [PostgreSQL](https://bbhosted.cuny.edu/webapps/blackboard/content/listContent.jsp?course_id=_2010109_1&content_id=_59525198_1)

  This folder provides instructions for install PostgreSQL, and loading the flights and tb databases that we will use in the course.  

  You may use either PostgreSQL or MySQL for the assignments.  You may also use other databases, but you'll then need to be responsible for determining your own processes for loading these databases.

- 

  ### Hands On Lab 2-1: Review of SQL Select statements

  Attached Files:

  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) HOL_SQLSelectBasics.sql](https://bbhosted.cuny.edu/bbcswebdav/pid-59525199-dt-content-rid-462120033_1/xid-462120033_1) (2.299 KB) 
  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) HOL SQL SELECT basics.pdf](https://bbhosted.cuny.edu/bbcswebdav/pid-59525199-dt-content-rid-462120034_1/xid-462120034_1) (288.516 KB) 

  These ungraded hands-on labs will help you practice using MySQL workbench and the flights database, and will help you to review  your skills working with selecting, filtering and sorting information in a SQL SELECT statement. Solutions to all problems are immediately available, but you’ll learn the material more durably if you attempt each problem before consulting its solution.

  All of the queries use tables in the flights database. You may find the data descriptions [here](http://cran.r-project.org/web/packages/nycflights13/nycflights13.pdf) helpful.

- 

  ### Hands on Lab 2-2: Export SQL data to a CSV file

  Attached Files:

  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) HOL Export SQL to CSV.pdf](https://bbhosted.cuny.edu/bbcswebdav/pid-59525200-dt-content-rid-462120035_1/xid-462120035_1) (172.294 KB) 
  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) HOL_SQLtoCSV.sql](https://bbhosted.cuny.edu/bbcswebdav/pid-59525200-dt-content-rid-462120036_1/xid-462120036_1) (1.047 KB) 

  The attached file provides some hands on labs for creating a .CSV file that can be uploaded into Excel.

- 

  ### Downloading and installing the tb database

  Attached Files:

  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) tb.sql](https://bbhosted.cuny.edu/bbcswebdav/pid-59525201-dt-content-rid-462120039_1/xid-462120039_1) (538 B) 
  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) tb.csv](https://bbhosted.cuny.edu/bbcswebdav/pid-59525201-dt-content-rid-462120040_1/xid-462120040_1) (142.564 KB) 

  Here are the instructions for downloading the tb database.  This assumes that you have already installed MySQL, including MySQL workbench.

  1. Download the attached tb.csv and tb.sql files and copy the files to a folder on your local machine.  On my PC, I used a pre-exisiting folder called c:\data.
  2. Launch MySQL workbench.
  3. Create a new MySQL schema (database) called tb.
  4. Make the tb database yor default schema.
  5. Open the script tb.sql. *If you copied the files to a different folder on your PC, or you copied to a Mac folder, you'll need to modify the LOAD command in the script to point to the correct file location.*
  6. Run the tb.sql script.  You should verify that 3,800 rows were successfully loaded.

  You may find it helpful to watch again the 3 minute video on MySQL Workbench in your Week Zero folder.

  This data was sourced from the World Health Organization's Tuberculosis [database](http://www.who.int/tb/country/data/download/en/), with some additional "data munging" performed by the R Studio team.

- 

  ### Hands on Lab 2-3: Combining Data from Multiple Sources

  Attached Files:

  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) population.csv](https://bbhosted.cuny.edu/bbcswebdav/pid-59525202-dt-content-rid-462120037_1/xid-462120037_1) (48.855 KB) 
  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) Hands on Lab Combining Data from Multiple Sources.pdf](https://bbhosted.cuny.edu/bbcswebdav/pid-59525202-dt-content-rid-462120038_1/xid-462120038_1) (113.986 KB) 

  Here are three exemplary student solutions from a previous DATA 607 class.  You will get considerably more benefit from reviewing these solutions if you start by attempting your own solution!

  - Scott Karr (2016): [Tuberculosis Lab.](http://rpubs.com/smkarr/152873) Terrific analysis and formatting.
  - Keith Folsom (2016): [Week 3 - Combining Data from Multiple Sources](http://rpubs.com/kfolsom98/152912). Outstanding work.
  - Daniel Smilowitz (2016): [DATA 607 Week 3 Assignment](http://rpubs.com/dsmilo/152861). Nice conversion of -1s to NAs.

- 

  ### Creating and Connecting to a Cloud-based Database (optional)

  

  Here is an 8 minute video on Connecting to a Google Cloud-managed MySQL instance from MySQL Workbench. 

  As an optional, advanced version of your assignment, consider connecting from R to a database that you create on Amazon Web Services, Microsoft Azure, or Google Compute Platform.

  CUNY's Data Science program--and this course--focus on the core skills for the *data scientist* role. Operationalizing databases in the cloud is typically part of the *data engineer* role.  But data scientists who also have some data engineering skills are highly valued in the marketplace. Also, being able to work in the cloud and/or with container technologies like Docker make it easier, faster, and safer to set up complex development environments such as TensorFlow.

- 

  ### [Discussion 2: The Future of Work](https://bbhosted.cuny.edu/webapps/blackboard/content/launchLink.jsp?course_id=_2010109_1&content_id=_59525204_1&mode=view)

  Please read this essay:

  - Geoff Colvin (2014): [In the future, will there be any work left for people to do?](http://fortune.com/2014/06/02/fortune-500-future/)

  In Colvin's essay--and in his more recent book, *Humans are Underrated--*he describes how computers with large amounts of data are disrupting the world of work. An example cited in the book is that “e-discovery would enable one lawyer to do the work of 500 or more…”

  ![Humans are Underrated Book Cover](https://bbhosted.cuny.edu/bbcswebdav/pid-59525204-dt-content-rid-462118994_1/xid-462118994_1)

  

  

  

  Can you think of another example where "big data" has (or might) eliminate jobs, allowed one person to do the work of many, or performs new work that was not previously possible?

  *Please post your thoughts before Meetup on Wednesday, and respond to at least one classmate’s post by Sunday.*

- 

  ### [Week 2 Assignment](https://bbhosted.cuny.edu/webapps/assignment/uploadAssignment?content_id=_59525205_1&course_id=_2010109_1&group_id=&mode=view)

  Attached Files:

  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) Assignment - SQL and R.pdf](https://bbhosted.cuny.edu/bbcswebdav/pid-59525205-dt-content-rid-462120046_1/xid-462120046_1) (132.454 KB) 

  See attached .PDF

   