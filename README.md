# Database Design Project

### Team Members: Taylor Lyberger, Justin Rezende, Lauren Hanlon, Nicole Benun, Joao Drummond, Achilleas Ghinis, Emily Rah, Matt Campbell

## Goal

The goal of this project was to develop a database for a student organization at UC Berkeley: The Berkeley Group as a part of the course IEOR 115: Industrial and Commerical Data Sysetms. More information about the course can be found [here](http://www.ieor.berkeley.edu/~ieor115/index.html).

> To gain real world experience in database design, teams of students will work with a local organization (small company, university department, campus organization, etc.) on a semester-length Database Design Project (DP). The DP starts with analysis of the organization's current methodology and needs, and proceeds through data modelling, design, and implementation of a prototype Relational Database, including queries, forms, and reports. Your design should not be limited by the current needs of the organization (you should free to add features/relations that your client may feel are unnecessary). Teams should emphasize the structure of their design and richness of their queries rather than the user interface. Extra credit will be given for mathematical analysis involving IEOR methods. The organization must understand that your prototype is not a fully operational system (and that you will not provice maintainance and customer support after the class is over!).

## Client Overview

The Berkeley Group (TBG) is a student run consulting firm that provides management consulting services to Bay Area nonprofits. TBG was founded in 2003 by four UC Berkeley students, and it has assisted over 100 social sector organizations in the San Francisco Bay Area. TBG believes that helping social sector organizations with their business challenges is a unique way to create sustainable change in its community, and the organization strives to provide the highest quality services to its clients in order to maximize their capacity for social impact.

## Project Overview

We built a full database in MS Access, complete with relationships, forms and reports. We completed a normalization analysis for our design where relations were in 2NF, 3NF or BCNF. We also wrote SQL queries to pull data and python/R models to analyze and interpret data that might be helpful to our client.

Models of data included: linear modeling to score applicants, linear forecasting of marketing strategy ROI, UPGMA hierarchical cluster algorithm to find proximity of memebers to alumni, stable-marriage algorithm to match members to projects and Holt-Winter forecasting model for budgeting.

## File Structure

<pre><code>
database-design-project/
README.md
code/
    modeling-scripts/
        project-matching.R
        project-matching.pdf
    sql-queries/
        query1.sql #applicant score
        query2.sql # marketing strategy ROI
        query3.sql # alumni info
        query4.sql # project matching
        query5.sql # budget forecasting
database/
    database-relations.pdf
    relational-schema.pdf
report
    FinalReport.pdf
    FinalPresentation.pdf
</code></pre>