### Exercise 1
In this exercise, I had to clean up a messy SQL script. The cleaned SQL script can be accessed [here](https://github.com/jaredbach/actblue-data-analyst/blob/main/sql-refinement.sql). I started by walking through each query to get a sense of what it was doing. Once I understood the logic, I started reorganizing things—flattening nested queries, creating CTEs to make the code easier to follow, and reformatting everything for readability (all lowercase, leading commas, etc.).

One thing that stood out was how many `select` statements were used for such a simple final aggregation—it felt like a lot of extra steps. I also noticed the final join wasn’t really necessary if we were only looking at ActBlue donations and already knew ActBlue is based in MA. Skipping that join could’ve saved some processing time and computational costs.

### Exercise 2  
I completed this exercise in a Jupyter notebook that can be accessed [here](https://github.com/jaredbach/actblue-data-analyst/blob/main/Exercise%202.ipynb). This exercise helped me better understand what the SQL was doing in exercise 1 and also reaffirmed that some of the joins felt kind of redundant. I used Python to join the two CSV files, which confirmed that most ActBlue donations come from out of state.

I walked through all my data cleaning steps in a Jupyter notebook and used Python packages to create visualizations. I purposely avoided using a platform like Looker here. While dashboards are great for repeat views, I wanted flexibility to slice the data in lots of different ways without having to re-export or reload anything. Jupyter made it easier to keep everything organized and explain each insight right above the corresponding visual.

As for insights: the biggest takeaway I had from this exercise was how exceptional the Sanders campaign did with fundraising. Not only did they raise the most money but they also had the highest number of first-time donors. February 29th also caught my attention; donations spiked that day, which makes sense since it was the South Carolina primary (where Biden won big and reshaped the remainder of the Democrat primary). I go into more detail about other insights inside the Jupyter notebook.

### Open Questions
1. I’m still not sure how valuable the FEC data was in this analysis—it felt disconnected from the rest of the ActBlue dataset, but maybe I missed something?
2. I think I’ve figured out the difference between `contribution_aggregate` and `contribution_amount`, but I’d love a gut check to make sure I did all the aggregations correctly.
3. I am also a little confused about what constitues a committee. For example, why is it that there were a lot of donations to Actblue as an entity in my first graph? Can someone just donate money to Actblue without specifying a campaign or PAC?
4. Additionally, I am confused why Actblue is considered a committee (i.e. the committee ID for Actblue is C00401224). I would have thought that only campaigns would be considered committees and not the platform that facilitates transactions.
