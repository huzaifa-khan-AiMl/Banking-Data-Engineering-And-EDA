# Data Exploration

The purpose of this exploratory analysis is to understand each table 
individually, identify meaningful patterns, and determine which 
attributes are useful for later multi-table analysis.

## Customers Table

**Total Customers:** 50,000

**Credit Score**
| Min | Max | Avg |
|-----|-----|-----|
| 300 | 850 | 547 |

`Insights`: Customer credit scores span the complete valid range 
(300–850), with an average of approximately 547, indicating a dataset 
centered around moderate creditworthiness.

**New Customers by Year**
| Year | New Customers |
|------|---------------|
| 2019 | 7,088 |
| 2020 | 7,186 |
| 2021 | 6,953 |
| 2022 | 7,129 |
| 2023 | 7,037 |
| 2024 | 7,284 |
| 2025 | 7,323 |

`Insights`: New customers are fairly evenly distributed across years, 
with a slight peak in 2025.

### Decisions
**Cities:** Approximately 25,000 distinct city names exist among 50,000 
customers. Since nearly every second customer belongs to a different 
city and the locations appear randomly generated rather than 
real-world values, city-based analysis was excluded — it would not 
produce meaningful business insights.

### Summary
50,000 customers, fairly evenly distributed across years. Credit scores 
range from 300–850 with an average of 547. The most notable finding was 
that city names are almost entirely unique per customer (~25,000 
distinct values across 50,000 rows), strongly suggesting this column 
was randomly generated rather than reflecting real customer locations.

---

## Accounts Table

**Total Accounts:** 75,000

**Accounts by Type**
| Account Type | Count |
|---|---|
| Checking | 25,090 |
| Business | 24,948 |
| Savings | 24,962 |

`Insights`: Account types are almost evenly distributed.

**Average Account Balance:** 100,181.72

**Average Balance by Opening Year**
| Year | Average Balance |
|------|-----------------|
| 2019 | 99,405.11 |
| 2020 | 99,448.37 |
| 2021 | 100,576.08 |
| 2022 | 101,082.11 |
| 2023 | 100,411.60 |
| 2024 | 99,460.66 |
| 2025 | 100,873.25 |

`Insights`: Average balance is stable across years, with only minor 
variation.

**Customers by Account Ownership**
| Total Accounts | Customers |
|---|---|
| 1 | 16,617 |
| 2 | 12,663 |
| 3 | 6,309 |
| 4 | 2,354 |
| 5 | 692 |
| 6 | 172 |
| 7 | 26 |
| 8 | 5 |

- Customers with more than one account: **22,221**

`Insights`: Most customers own one or two accounts; ownership of more 
than five accounts is rare.

**Note — customers with zero accounts:** the ownership table above sums 
to 38,838 customers, but there are 50,000 customers total — meaning 
roughly **11,162 customers (~22%) have no account at all**. This is 
worth investigating further once multi-table joins are possible: are 
these loan-only customers, or a genuine data gap?

**Avg, Max, Min Balance by Account Type**
| Type | Max Balance | Min Balance | Avg Balance |
|---|---|---|---|
| Business | 199,969.50 | 13.20 | 100,154.94 |
| Checking | 199,994.58 | 28.55 | 100,147.97 |
| Savings | 199,989.26 | 13.21 | 100,242.42 |

`Insights`: Balance statistics are nearly identical across account 
types, with negligible variation.

### Decisions
- Max/min balances alone were not analyzed further — average balance 
  and account ownership distribution were more analytically useful.
- Max/min and average balance by account type were both de-prioritized, 
  since the difference between types was negligible in each case.

### Summary
75,000 accounts across three roughly equal types (Checking, Business, 
Savings). About 22,221 customers hold more than one account, while an 
unexpected ~22% of customers hold none at all — a gap worth revisiting 
once joins with the loans table are possible. Average balance is stable 
across years and account types alike.

---

## Loans Table

**Loan Amount Statistics**
| Max Loan | Min Loan | Avg Loan | Median Loan |
|---|---|---|---|
| 299,975.47 | 1,010.16 | 150,089.02 | 150,571 |

`Insights`: The average and median loan amounts sit almost exactly at 
the midpoint between the minimum and maximum, indicating a roughly 
symmetric, evenly spread distribution of loan amounts rather than one 
skewed toward either extreme.

**Interest Rate Statistics**
| Max Rate | Min Rate | Avg Rate |
|---|---|---|
| 15.00 | 2.00 | 8.51 |

`Insights`: The average interest rate sits close to the midpoint of 
the valid range.

**Average Interest Rate by Loan Amount Range**
| Loan Range | Avg Interest Rate |
|---|---|
| Under 50K | 8.46 |
| 50K–100K | 8.63 |
| 100K–150K | 8.52 |
| 150K–200K | 8.48 |
| 200K+ | 8.48 |

`Insights`: No meaningful relationship between loan amount and interest 
rate — rates stay flat across all ranges.

**Average Loan Amount and Interest Rate by Year**
| Year | Avg Loan Amount | Avg Interest Rate |
|------|------------------|--------------------|
| 2019 | 150,057.07 | 8.51 |
| 2020 | 148,762.79 | 8.56 |
| 2021 | 150,786.47 | 8.51 |
| 2022 | 151,337.44 | 8.53 |
| 2023 | 148,114.92 | 8.45 |
| 2024 | 150,301.06 | 8.48 |
| 2025 | 151,189.78 | 8.52 |

`Insights`: Both loan amount and interest rate are effectively 
independent of year — no upward or downward trend over time.

**Loan Ownership**
- Unique customers with loans: 22,586
- Average loans per borrowing customer: 1.32

**Loans Issued by Year**
| Year | Loan Count |
|------|------------|
| 2019 | 4,393 |
| 2020 | 4,207 |
| 2021 | 4,297 |
| 2022 | 4,307 |
| 2023 | 4,211 |
| 2024 | 4,266 |
| 2025 | 4,319 |

`Insights`: Loan issuance is consistent year over year, with no 
significant trend.

**Overall Loan Distribution**
| Loan Range | Loan Count |
|---|---|
| Under/Equal 200K | 20,032 |
| 200K–220K | 2,029 |
| 220K–240K | 1,963 |
| 240K–260K | 2,057 |
| 260K–280K | 1,915 |
| 280K+ | 2,004 |

`Insights`: Roughly 66.8% of loans fall at or below 200K, while the 
remaining 33.2% are spread fairly evenly across higher brackets.

### Decisions
Loan distribution above 200K was broken into further ranges, but the 
counts were evenly spread with nothing distinctive to report.

### Summary
30,000 loans, held by 45.17% of all customers, averaging 1.32 loans per 
borrowing customer. About 66.8% of loans are under 200K. Loan amount 
and interest rate are both essentially flat across time and show no 
relationship to each other.
