# Week 13: Working with Data in the Cloud; Deployment [15-Nov 21-Nov]



- ### Overview

  This week, we'll look at cloud computing,  distributed processing paradigms, Hadoop, and Spark.

  Arguably, the two most important platforms today are Amazon Web Services and Microsoft Azure.  Google Cloud is increasingly important and compelling.  DataBricks Community Edition--which is a cloud environment built on top of AWS--is a great, low-cost Spark learning environment. 

  You're encouraged to download Hadoop and work with it on a virtual machine. 

  ***\*Events and Deliverables\****

  | Wednesday | Meetup, 6:45 p.m. ET        |
  | --------- | --------------------------- |
  | Wednesday | Discussion initial post due |
  | Sunday    | Discussion response due     |



---

- ### [[OPTIONAL\] Working in the Cloud](https://bbhosted.cuny.edu/webapps/blackboard/content/listContent.jsp?course_id=_2010109_1&content_id=_59525089_1)

- ### Learning more about Cloud Computing

  Attached Files:

  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) Data Science in the Cloud.pdf](https://bbhosted.cuny.edu/bbcswebdav/pid-59525093-dt-content-rid-462120005_1/xid-462120005_1) (396.036 KB) 

  ![electric grid](https://bbhosted.cuny.edu/bbcswebdav/pid-59525093-dt-content-rid-462118973_1/xid-462118973_1)

  

  [![img](http://i.ytimg.com/vi/BYP3uMOobqk/1.jpg)Watch Video ](http://www.youtube.com/watch?v=BYP3uMOobqk)

  Era of the Cloud: Nicholas Carr (Google Atmosphere Session 2) 

  **Duration:** 31:05 
  **User:** n/a - **Added:** 10/28/09 

  **YouTube URL:** http://www.youtube.com/watch?v=BYP3uMOobqk

  

  - The attached slide deck also provides some background and context about doing data science in the cloud.

  

- ### Learning More about Amazon Web Services (OPTIONAL)

  Here is the information for signing up for AWS's free tier: [AWS Free Tier](https://aws.amazon.com/free/)

  And here is [AWS's Getting Started Guide](https://aws.amazon.com/getting-started/).

  Here are some fast-path instructions for **setting up RStudio on AWS**.  These instructions are bare-bones in terms of security, and you want to make sure you sign up for the free-tier (1 year), unless you're willing to pay charges as you go.

  - [RStudio Server Amazon Machine Image (AMI)](http://www.louisaslett.com/RStudio_AMI/).
  - Ken Kleinman (2012): [RStudio in the cloud, for dummies](http://www.r-bloggers.com/rstudio-in-the-cloud-for-dummies/). 
  - [Connecting to Your Linux Instance from Windows Using PuTTY](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html)

  

- ### Learning more about Microsoft Azure (OPTIONAL)

  - [Sign up](https://azure.microsoft.com/en-us/pricing/free-trial/) for Microsoft Azure's 30 day ($200 in usage) trial.
  - [Getting started videos for Azure](https://azure.microsoft.com/en-us/get-started/).
  - [Microsoft's jump start course](https://mva.microsoft.com/en-us/training-courses/getting-started-with-microsoft-azure-machine-learning-8425) for Azure Machine Learning.
  - Overview of Microsoft's cloud offering for machine learning, with demonstrations. [Data Science with Azure Machine Learning, SQL Server and R, Rafal Lukawiecki](https://sec.ch9.ms/sessions/ignite/2015/BRK3550.mp4), [video 1:13]. 
  - Stephen Elston (2015): [*Data Science in the Cloud with Microsoft Azure Machine Learning and R* ](https://www.oreilly.com/library/view/data-science-in/9781491917176/), Freely downloadable, but you need to provide your contact information.

  ![Azure](https://bbhosted.cuny.edu/bbcswebdav/pid-59525097-dt-content-rid-462118974_1/xid-462118974_1)

---

- ### [[OPTIONAL\] Distributed Processing Paradigms](https://bbhosted.cuny.edu/webapps/blackboard/content/listContent.jsp?course_id=_2010109_1&content_id=_59525090_1)

- ### Performance

  One motivation for running R programs in the cloud is to be able to run on a machine with a lot of RAM and fast computational speed.  Here is some additional reading on ways to improve performance in your R code.  Julia is basically a subset of R with some rough edges.

  - Hadley Wickham's *Advanced R* book has five superb chapters on performance (about 12o written pages).  Read what he writes about making your R code faster [here.](http://adv-r.had.co.nz/) [start [here](http://adv-r.had.co.nz/Performance.html)]
  - You can learn more about Julia here: https://julialang.org/learning/ . This is exciting but raw stuff. 

  

- ### Learning more about MapReduce

  Attached Files:

  - [![File](https://bbhosted.cuny.edu/images/ci/ng/cal_year_event.gif) Map Reduce from R in a Nutshell.pdf](https://bbhosted.cuny.edu/bbcswebdav/pid-59525096-dt-content-rid-462120006_1/xid-462120006_1) (346.285 KB) 

  Please read/watch the following:

  - To get an overview of the MapReduce paradigm, I'd start with [chapter 2](http://infolab.stanford.edu/~ullman/mmds/ch2.pdf) from [*Mining Massive Datasets*](http://www.mmds.org/) by Jure Leskovec, Anand Rajaraman, and Jeff Ullman. The authors also periodically offer a free related Stanford/Coursera course [here](https://www.coursera.org/course/mmds).
  - [Introducing Apache Hadoop to Developers](http://hortonworks.com/hadoop-tutorial/introducing-apache-hadoop-developers/).
  - “How MapReduce Works,” from Joseph Adler’s *R in a Nutshell, 2nd edition*, O’Reilly 2012.  *Excerpt attached.*

  [![img](http://i.ytimg.com/vi/bcjSe0xCHbE/1.jpg)Watch Video ](http://www.youtube.com/watch?v=bcjSe0xCHbE)

  Learn MapReduce with Playing Cards 

  **Duration:** 9:44 
  **User:** n/a - **Added:** 8/14/13 

  **YouTube URL:** http://www.youtube.com/watch?v=bcjSe0xCHbE



- ### Text in Distributed Systems [VIDEO series]

  Here is a set of examples of working with text in MapReduce from Bill Howe (University of Washington).

  [![img](http://i.ytimg.com/vi/qrxqcnjOOGc/1.jpg)Watch Video ](http://www.youtube.com/watch?v=qrxqcnjOOGc)

  3 - 1 Scalability Basics 1618) 

  **Duration:** 16:19 
  **User:** n/a - **Added:** 6/29/13 

  **YouTube URL:** http://www.youtube.com/watch?v=qrxqcnjOOGc

  

  [![img](http://i.ytimg.com/vi/RAFHG5mKi-M/1.jpg)Watch Video ](http://www.youtube.com/watch?v=RAFHG5mKi-M)

  3 - 2 Parallel Processing Patterns 1126) 

  **Duration:** 11:27 
  **User:** n/a - **Added:** 6/29/13 

  **YouTube URL:** http://www.youtube.com/watch?v=RAFHG5mKi-M

   

  [![img](http://i.ytimg.com/vi/OlD9CMDNah0/1.jpg)Watch Video ](http://www.youtube.com/watch?v=OlD9CMDNah0)

  3 - 3 MapReduce Abstractions 1117) 

  **Duration:** 11:18 
  **User:** n/a - **Added:** 6/29/13 

  **YouTube URL:** http://www.youtube.com/watch?v=OlD9CMDNah0

   

  [![img](http://i.ytimg.com/vi/egOk_EXWkJ4/1.jpg)Watch Video ](http://www.youtube.com/watch?v=egOk_EXWkJ4)

  3 - 4 MapReduce Pseudocode 754) 

  **Duration:** 7:55 
  **User:** n/a - **Added:** 6/29/13 

  **YouTube URL:** http://www.youtube.com/watch?v=egOk_EXWkJ4

   

  [![img](http://i.ytimg.com/vi/XjX8_m-u2wY/1.jpg)Watch Video ](http://www.youtube.com/watch?v=XjX8_m-u2wY)

  3 - 5 MapReduce Text Examples 958) 

  **Duration:** 9:59 
  **User:** n/a - **Added:** 6/29/13 

  **YouTube URL:** http://www.youtube.com/watch?v=XjX8_m-u2wY

---

- ### Effective Organization of Projects and Presentations

  Here are some good resources for organizing information in projects and presentations. While s*ome of the recommendations are definite overkill for your 607 final project, as you continue in the MSDA program, and the projects in your portfolio become more complex, you may find it helpful to return to these resources.*

  Tal Galili (2010): [Managing a statistical analysis project – guidelines and best practices](http://www.r-statistics.com/2010/09/managing-a-statistical-analysis-project-guidelines-and-best-practices/)

  Kenton White: [ProjectTemplate](http://projecttemplate.net/)

  Presentation Zen: http://www.presentationzen.com/

  Seth Godin (2007): [Really Bad PowerPoint](http://sethgodin.typepad.com/seths_blog/2007/01/really_bad_powe.html), and [eBook.](http://www.sethgodin.com/freeprize/reallybad-1.pdf) Presentations are usually about either persuasion or information transfer, and Seth Godin’s advice is more about effective persuasion, but his suggestions are also useful when your goal is information transfer.

---

- ### [Discussion 13: Code First?](https://bbhosted.cuny.edu/webapps/blackboard/content/launchLink.jsp?course_id=_2010109_1&content_id=_59525092_1&mode=view)

  When software developers build out applications from requirements, they often start with either the user interface design or the database design. Recently, many developers have adopted “schema-less” databases like MongoDB. Choosing MongoDB means that the developer could postpone designing a database schema, or in some cases, do away entirely with a fixed schema. 

  ***What are the advantages and disadvantages of a “code first” vs. “data first” design methodology?\*** 

  Give specific examples, considering factors like how business logic is handled, and the number of different applications that work with the given data.

  