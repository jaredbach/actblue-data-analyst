# Data Analyst Technical Assessment

The following exercise is designed to help us get a sense of how you write and communicate data insights with both stakeholders and other data team members. It is split into two parts: one that tests your SQL skills and the other focused on your ability to analyze data and present findings in a clear, engaging, and actionable way. 

## Expectations

1. We don’t expect you to spend more than 90 minutes on these two exercises, so just work through the questions within the time limit and see what you can complete. 
2. We think the provided data is sufficient to answer some really interesting questions and do not expect you to incorporate any additional data sources. 
3. We don’t expect you to be familiar with our filing data - please make assumptions, but be sure to document them in your code so that we can follow your thought process.

## Submitting Your Work 
- When you’re ready, please share the link to your Github repository. It should include the following: 

Exercise Part 1: SQL Refactor

- A .sql or .txt file containing your refactored SQL query 
- Comments to explain your thought process, reasoning behind changes, what assumption did you make 

Exercise Part 2: Storytelling with Data

- If using a data visualization tool: a link to data visualizations and analysis conducted or screenshots of visualization and analysis included in repo 
- If using Python or R include notebook file for your analysis, OR an R or Python file with your code + comments to help us follow your work
- In your repository's README file provide any additional context on the analysis you performed and any insights you found. Also provide a brief description of your analysis method of choice and how this may have helped you answer questions in this exercise. 


## Exercise One: SQL Refactor
**Objective**: Refactor [this SQL Query](https://docs.google.com/document/d/17gBXAvGRIXUl9up7S794oHpLBQK6gIQw73u8eJSAB9M/edit?usp=sharing) so that it is easily readable by your teammates and fix any syntax errors you come across, clean up formatting, and add context where needed. 

**Background**: 
  - We store our data in a redshift database, and while we’ve done a lot of good work modeling this raw resource to help ourselves and teams across the organization quickly answer basic questions about fundraising patterns on our site, many of the deeper explorations our team does for the organization starts with manipulating the data stored in our redshift cluster using SQL. 
  - This query is a messy version of the query we used to pull the data used in exercise two of this take home. All of the where clauses, and table sources are correct and don’t need to be updated, but this is obviously not a great work product to share with colleagues - it’s hard to scan for quick understanding of the work, has inconsistent syntax, and there are some syntactical errors that would cause this query run to fail. 

**Suggested Time**: 30 minutes 

**What we're looking for**:
  - Clear and readable formatting. If you are not familiar with Common Table Expressions (CTEs) check out [this resource](https://learnsql.com/blog/what-is-common-table-expression/)
  - Everyone has different SQL styles and we are intentionally not sharing our internal style guide, so prioritize consistency over a specific style
  - Highly suggested that you leave comments throughout the file to explain your work, express uncertainty, suggestions on how to improve the query, or ask questions


## Exercise Two: Storytelling with Data 
**Objective**: Draw insights from real world campaign finance data like ActBlue’s (publicly available) FEC filing using a data visualization tool of your choice e.g Tableau Public, Looker Data Studio, etc. 


**Materials**:

Dataset #1: A sample of contribution data from ActBlue’s FEC filings:
  - [`Data_Science_Technical_FEC_Filing_Sample.csv`](https://drive.google.com/file/d/1mHS1k9xC1JKcjrjtqCGvrEj14YzuDsLn/view?usp=drive_link) is a sample of records derived from 3 of [ActBlue's monthly filings](https://www.fec.gov/data/committee/C00401224/?tab=filings&cycle=2020) in the 2020 cycle: [February Monthly 2020](https://docquery.fec.gov/cgi-bin/forms/C00401224/1385527/), [March Monthly 2020](https://docquery.fec.gov/cgi-bin/forms/C00401224/1391686/), [April Monthly 2020](https://docquery.fec.gov/cgi-bin/forms/C00401224/1402724/).
  
Dataset #2: FEC committee data from the 2020 cycle:
  - [`Data Science_Technical_FEC_Committee_Data_2020.csv`](https://drive.google.com/file/d/1oCMfdRZVSyFuhjIhtEMlq4a9upXbMDWp/view?usp=drive_link) is derived from the Committee Master file for 2019-2020 provided on the [FEC Bulk Data page](https://www.fec.gov/data/browse-data/?tab=bulk-data).


**Tools**:
Python or R and data visualization tool 


**Instructions**:

- Begin with data hygiene: describe the data integrity checks you'd typically use before analyzing a new dataset
- Join the datasets: merge contribution and committee data 
- Analyze the data and tell a story: Using a tool of your choice visualize the FEC datasets. Show any statistical or exploratory analysis you performed (are there any trends you see, any takeaways)
- Ask 1-2 questions based on this data to highlight anything that stands out to you or something people may have missed with these datasets

**Suggested Time**: 60 minutes 
