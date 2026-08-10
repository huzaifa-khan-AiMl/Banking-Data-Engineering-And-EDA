# Project Conclusion

## Initial Intentions

- The original goal was to build a full-fledged customer churn analysis project. When the dataset turned out to contain no churn-related column, the scope was expanded 
into a complete banking data analysis project instead of discarding it entirely.
- The project was intended to move through a full pipeline — from SQL queries through to feature engineering.

## Dataset Validation

- This is where the missing churn column was first discovered, leading to the pivot toward a broader banking analysis project.
- Validation focused on checking for missing values, duplicates, and invalid values — to my surprise, none were found.

## Exploratory Analysis

- This is where the pattern started becoming clear: exploring each table individually showed that none of the date columns carried any informative relationship with their 
respective tables.
- Other relationships found during this phase also showed no meaningful variation — for example, account types (Checking, Business, Savings) all had nearly identical average 
balances.
- A more striking discovery: the number of distinct cities was almost equal to the number of customers, with each city containing only 1–2 customers — and the city names 
themselves appeared randomly generated.
- The branches table also showed no connection to any other table.

## Cross-Table Validation

- The expectation was that joining tables like `customers` and `accounts` would surface meaningful relationships. Instead, the first few queries confirmed a growing suspicion 
that the dataset might be synthetically generated.
- After running several more targeted queries to test this suspicion directly, the conclusion became clear: the dataset is synthetic.

## Why Deeper Analysis Stopped

- Exploration and query-writing on this dataset stopped because continuing would have meant manufacturing findings from relationships that the data — as confirmed through 
cross-table validation — simply did not support.

## What I Learned

- Even though the dataset turned out to be synthetic, and the project couldn't reach the depth originally intended, the work still produced real, transferable experience: 
designing a schema from scratch, writing SQL queries across every stage of a pipeline, and — most importantly — learning to decide, at each step, whether a query or analysis 
was actually worth pursuing rather than just technically possible.

`Note`: Though this project didn't reach its original form as a full end-to-end data pipeline, it became something just as valuable — a complete SQL engineering project, 
where every query, decision, and conclusion (including the conclusion that the dataset is synthetic) was reached through deliberate, evidence-backed reasoning rather than 
assumption.
