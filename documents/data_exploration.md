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

### Decisions
- Maximum and minimum balances were not included because they provide limited analytical value compared with average balance and account ownership distribution.
- Maximum and Minimum by account type were also skipped though mainly because the differece of balance among themeselves was negligible.
- Average balance by account type was also skipped due to the same lack of difference reason as it was in max and min.

