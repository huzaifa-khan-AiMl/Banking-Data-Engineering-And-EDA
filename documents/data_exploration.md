# Data Exploration 
The purpose of this exploratory analysis is to understand each table individually, identify meaningful patterns, and determine which attributes are useful for later multi-table
analysis.

## Accounts Table:

__Total Customers__
50000

__Credit Score__
Min = 300
Max = 850
Avg = 547

`Insights`: Customer credit scores span the complete valid range (300–850), with an average score of approximately 547, indicating a dataset centered around moderate credit
worthiness.

__New Customers by Year__
| Year | New Customers |
|------|---------------|
| 2019 | 7088          |
| 2020 | 7186          |
| 2021 | 6953          |
| 2022 | 7129          |
| 2023 | 7037          |
| 2024 | 7284          |
| 2025 | 7323          |

`Insights`: Almost all the years had fair share of new customers with slight differences and maximum being in 2025

### Decisions:
__Cities__
Approximately 25,000 distinct city names exist among 50,000 customers. Since nearly every second customer belongs to a different city and the locations are randomly generated 
rather than real-world values, city-based analysis was excluded from further exploration because it would not produce meaningful business insights.

### Summary:
There are 50000 number of customers almost all new customers are equally distributed over the years credit score ranges from 300 to 850 avg being 547 most intriguing find was
that the there were approximately 25,000 distinct cities with random generated name and nearly every single customer belonged to a different city which implies that this column
was randomly generated

---

## Accounts Table:

__Number of Accounts__
75000

__Number of Accounts by Account Type__
| Account Type | Count  |
|--------------|--------|
| Checking     | 25090  |
| Business     | 24948  |
| Savings      | 24962  |

`Insights`: The number of account distributions among account types are almost equals to each other.

__Average Account Balance__
100181.72

__Average Balance by Year__
| Year | Average Balance      |
|------|----------------------|
| 2019 |  99405.11            |
| 2020 |  99448.37            |
| 2021 | 100576.08            |
| 2022 | 101082.11            |
| 2023 | 100411.60            |
| 2024 |  99460.66            |
| 2025 | 100873.25            |

`Insights`: Average Balance by year is also evenly distributed with some differences.

__Number of Customers by Account Ownership__
| Total Accounts | Customers |
|----------------|-----------|
| 8              | 5         |
| 7              | 26        |
| 6              | 172       |
| 5              | 692       |
| 4              | 2354      |
| 3              | 6309      |
| 2              | 12663     |
| 1              | 16617     |

- Customers having more than one account `22221`

`Insights`: Most customers own one or two accounts, while only a very small number own more than five accounts, indicating that multiple-account ownership is relatively 
uncommon in this synthetic banking dataset.

__ Avg, Max and Min by Account Type__
| Type     | Max Balance | Min Balance | Avg Balance          |
|----------|-------------|-------------|----------------------|
| Business | 199969.50   | 13.20       | 100154.938045133878  |
| Checking | 199994.58   | 28.55       | 100147.970630928657  |
| Savings  | 199989.26   | 13.21       | 100242.415014421921  |

`Insights`: The average max and min by card types are also also evenly distributed with little to no change

### Decisions
- Maximum and minimum balances were not included because they provide limited analytical value compared with average balance and account ownership distribution.
- Maximum and Minimum by account type were also skipped though mainly because the differece of balance among themeselves was negligible.
- Average balance by account type was also skipped due to the same lack of difference reason as it was in max and min.

### Summary:
There are 75000 accounts of three types Checking, Business and Saving all these types are almost equal in numbers in those 70000 accounts about 22221 customers have more than
1 account the average balance of these accounts are distributed evenly over the years overall and also by account type

## Loans Table:
__ Loan amount statistics __
| Max Loan  | Min Loan | Avg Loan            | Median Loan |
|-----------|----------|---------------------|-------------|
| 299975.47 | 1010.16  | 150089.016603333333 | 150571      |
`Insights`: The statistics suggest that the average loan is more closer to maximum loan than to the minimum

__ Interest Rate Statistics __
| Max Interest Rate | Min Interest Rate | Avg Interest Rate     |
|-------------------|-------------------|-----------------------|
| 15.00             | 2.00              | 8.5074183333333333    |

`Insights`: These statistics also shows perfect avg between max and min

__ Average Interest Rate by Loan Amount Range __
| Loan Range | Avg Interest Rate     |
|------------|-----------------------|
| 100K-150K  | 8.5198133279807306    |
| 150K-200K  | 8.4799862204724409    |
| 200K+      | 8.4780818619582665    |
| 50K-100K   | 8.6258742949234488    |
| Under 50K  | 8.4638733519776268    |
`Insights`: This table shows that there is no relation of increasing loan amount with interest rate

__ Average loan amount and interest rate by year __
| Year | Avg Loan Amount     | Avg Interest Rate     |
|------|---------------------|-----------------------|
| 2019 | 150057.072183018438 | 8.5076872296835875    |
| 2020 | 148762.792548134062 | 8.5576230092702638    |
| 2021 | 150786.471089131953 | 8.5059878985338608    |
| 2022 | 151337.437285813792 | 8.5269189691200371    |
| 2023 | 148114.918349560674 | 8.4528093089527428    |
| 2024 | 150301.060811064229 | 8.4823464603844351    |
| 2025 | 151189.779231303542 | 8.5182264413058578    |
`Insights`: It shows that the average rate of both interest and loan amount is independant of the years

__ Number of unique customers who have taken loans and Average number of loans per borrowing customer __
Avg Loans per Customers = 1.3
Number of Unique Customers who have taken Loans = 22586

__ Number of loans issued by year __
| Year | Loan Count |
|------|------------|
| 2019 | 4393       |
| 2020 | 4207       |
| 2021 | 4297       |
| 2022 | 4307       |
| 2023 | 4211       |
| 2024 | 4266       |
| 2025 | 4319       |
`Insights`: The number of loans issued by Year are same with litlle changes

__ Overall loan distribution __
| Loan Range        | Loan Count |
|-------------------|------------|
| 200K-220K         | 2029       |
| 220K-240K         | 1963       |
| 240K-260K         | 2057       |
| 260K-280K         | 1915       |
| 280K+             | 2004       |
| Under/Equal 200K  | 20032      |
`Insights`: This is the interesting finding as it shows that almost 66.77% number of loans are below 200k and about 33.23% number of loans are above 200k

### Decision:
We also did loan distribution above 200k ranges though the loan counts were evenly distributed and it had nothing important to be found

### Summary:
This table has 30000 loans which were taken by 45.17% of the Customers each customer had about 1.32 loans per average, about 66.77% number of loans are below 200k and about 
33.23% number of loans are above 200k number of loans, interest average and loans amount average are eqaul with some changes over the years
