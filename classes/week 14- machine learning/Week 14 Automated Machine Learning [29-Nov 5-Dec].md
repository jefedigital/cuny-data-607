# Week 14: Automated Machine Learning [29-Nov 5-Dec] 

### Week 15 Overview

This week, we'll look at big data analytics with a focus on running R on the Spark platforms.  There are two choices, both good:  sparkr, which is part of Apache Spark, and sparklyr, from rstudio.

**Events and Deliverables**

| Wednesday      | Meetup, 6:45 p.m. Early Final Project Presentations |
| -------------- | --------------------------------------------------- |
| Saturday       | Final Project Due                                   |
| Next Wednesday | Meetup: Final Project Presentations                 |

---

### Additional guidance on final projects and presentations

Attached Files:

- [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) Geron Project Checklist.pdf](https://bbhosted.cuny.edu/bbcswebdav/pid-59525075-dt-content-rid-462120002_1/xid-462120002_1) (145.011 KB) 

Attached is an excellent project management checklist from Aurélien Géron , who has just authored the (currently) best-selling (Python-based) book on Machine Learning.  Mr. Géron and O'Reilly both kindly gave me permission to distribute this checklist.  This is (only) intended as additional guidance for your final projects and presentations.  In particular, I'd encourage you to read through the recommended lists under (1) Frame the problem and look at the big picture, and (7) Present your solution.

![Geron book cover](https://bbhosted.cuny.edu/bbcswebdav/pid-59525075-dt-content-rid-462118969_1/xid-462118969_1)

![presentation zen](https://bbhosted.cuny.edu/bbcswebdav/pid-59525075-dt-content-rid-462118970_1/xid-462118970_1)

And here are some general presentation tips from Garr Reynolds, author of Presentation Zen:

**https://www.presentationzen.com/**

---

### [[OPTIONAL\] Additional material on Spark](https://bbhosted.cuny.edu/webapps/blackboard/content/listContent.jsp?course_id=_2010109_1&content_id=_59525076_1)

- ### sparklyr

  An alternative to using **sparkr** for working with R on Spark is the **sparklyr** package.  **sparklyr's** approach is to use Spark's APIs to generate SparkSQL code, that run on the worker threads.

  There is a lot of good content on sparklyr on the rstudio site, including this cheat sheet:

  **https://resources.rstudio.com/rstudio-developed/sparklyr-3**

  

  And here is a good overview video on sparklyr:

  [![img](http://i.ytimg.com/vi/oItFZfzqqMY/1.jpg)Watch Video ](http://www.youtube.com/watch?v=oItFZfzqqMY)

  R & Spark: How to Analyze Data Using RStudio's Sparklyr: by Nathan Stephens 

  **Duration:** 30:31 
  **User:** n/a - **Added:** 2/13/17 

  **YouTube URL:** http://www.youtube.com/watch?v=oItFZfzqqMY

  

- ### Setting up Spark

  Here are the [instructions for downloading Apache Spark](http://spark.apache.org/downloads.html).  While PCs are supported, in my experience, it's easier on a Mac or a Unix box.
  

- ### Setting up Spark and AWS

  Attached Files:

  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) awsscripts.txt](https://bbhosted.cuny.edu/bbcswebdav/pid-59525081-dt-content-rid-462120004_1/xid-462120004_1) (961 B) 

  **https://github.com/amplab/spark-ec2** 

  Getting a Spark/AWS environment set up on a PC requires some small adjustments.  Specifically,

  Where the Mac bash shell and Linux provide a secure shell command, ssh, there is no built-in equivalent on the PC.  I recommend using PuTTY here.  The .PEM file that you create for a Mac doesn't work with PuTTY, so you'll also need to use PuTTYgen to create a .PPK file from a .PEM file

  Where Mac and Linux copy files use scp to securely copy files, on a PC you need to use a tool like pscp.exe (that comes with PuTTY) or another alternative (such as the graphical WinSCP).

  The following 18 minute video shows a walk through of setting up a Spark ready cluster on AWS from a PC.  At the end of the process, you'll have a launching node, one master node, and two slave nodes.  I've also attached a script file with some of the code shown in the video.  You should treat most of the code in this script as template code--you'll need to modify based on the DNS name, IP address, and region that AWS assigns your node(s).

  

  Here are some additional resources that you may also find helpful.

  Manuel Amunategui, Sep 30, 2015. (Mac-based), “[Supercharge R with Spark: Getting Apache's SparkR Up and Running on Amazon Web Services (AWS)](http://amunategui.github.io/sparkr/)” 

  [![img](http://i.ytimg.com/vi/8Dsq4MeVh8M/1.jpg)Watch Video ](http://www.youtube.com/watch?v=8Dsq4MeVh8M)

  Using Putty to Connect to an Amazon EC2 

  **Duration:** 3:06 
  **User:** n/a - **Added:** 1/9/13 

  **YouTube URL:** http://www.youtube.com/watch?v=8Dsq4MeVh8M

  

- ### Conceptual Overview of Apache Spark and SparkR

  Here is a nice conceptual overview of Spark and SparkR: Joseph Rickert (2015): [A first look at Spark](https://blog.revolutionanalytics.com/2015/01/a-first-look-at-spark.html)

  I highly recommend the referenced YouTube presentation [1 hour 10 minutes] by Reza Zadeh:

  [![img](http://i.ytimg.com/vi/-TiMNoj7Rrs/1.jpg)Watch Video ](http://www.youtube.com/watch?v=-TiMNoj7Rrs)

  An Update on Distributed Computing with Spark, Reza Zadeh 20141025 

  **Duration:** 69:55 
  **User:** n/a - **Added:** 1/16/15 

  **YouTube URL:** http://www.youtube.com/watch?v=-TiMNoj7Rrs

- ### Spark and SparkSQL

  Here is a UC Berkeley AMP Camp talk by SparkSQL creator Michael Armbrust: 

  [![img](http://i.ytimg.com/vi/KiAnxVo8aQY/1.jpg)Watch Video ](http://www.youtube.com/watch?v=KiAnxVo8aQY)

  AMP Camp 5: SparkSQL - Michael Armbrust 

  **Duration:** 45:25 
  **User:** n/a - **Added:** 12/4/14 

  **YouTube URL:** http://www.youtube.com/watch?v=KiAnxVo8aQY

- ### Apache Hive

  Here is some "getting started" information on Hive, a SQL-like language for Hadoop.

  [![img](http://i.ytimg.com/vi/Pn7Sp2-hUXE/1.jpg)Watch Video ](http://www.youtube.com/watch?v=Pn7Sp2-hUXE)

  Hadoop Tutorial: Apache Hive 

  **Duration:** 16:34 
  **User:** n/a - **Added:** 6/3/13 

  **YouTube URL:** http://www.youtube.com/watch?v=Pn7Sp2-hUXE


  See also Horton Works: [How to Process Data with Apache Hive](https://hortonworks.com/tutorial/how-to-process-data-with-apache-hive/)

- ### pySpark

  DataCamp provides a [pySpark cheat sheet](https://s3.amazonaws.com/assets.datacamp.com/blog_assets/PySpark_Cheat_Sheet_Python.pdf).

---

### Getting Started on Spark with Databricks

Attached Files:

- [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) DataBricksJumpStart.pdf](https://bbhosted.cuny.edu/bbcswebdav/pid-59525077-dt-content-rid-462120003_1/xid-462120003_1) (44.282 KB) 

The fastest way to get started building Spark applications in the cloud is with Databricks.  I've attached some instructions on building a beachhead using sparkR.

edx offers an excellent and free short course on "[Introduction to Apache Spark](https://www.edx.org/course/introduction-apache-spark-uc-berkeleyx-cs105x)" that will help you get up to speed quickly on building out basic PySpark applications on the DataBricks cloud.

---

### FINAL PROJECT

Your final project is due on Sunday, and your final project presentation needs to be made (or recorded and submitted) during (or before) our last meetup next Wednesday.

You can find the final project requirements and assignment submission link in "Major Assignments".