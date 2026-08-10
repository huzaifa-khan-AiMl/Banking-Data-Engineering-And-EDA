# Banking Data Investigation — PostgreSQL & SQL

A SQL-based investigation of a synthetic banking dataset using PostgreSQL. The project covers relational database design, data loading, validation, exploratory analysis, and dataset assessment.

## Dataset

**Source:** [Synthetic Banking Dataset — Kaggle](https://www.kaggle.com/datasets/akrambelha/synthetic-banking-dataset-csv-sql-sqlite?utm_source=chatgpt.com)

The dataset contains seven banking-related tables:

| Table | Rows |
|---|---:|
| Customers | 50,000 |
| Accounts | 75,000 |
| Loans | 30,000 |
| Cards | 100,000 |
| Merchants | 5,000 |
| Transactions | 1,000,000 |
| Branches | 500 |

Approximately **1.3 million records** were loaded into PostgreSQL.

## Project Objective

The project originally started as a **customer churn analysis**. However, the dataset contained no churn-related target, so the scope was changed to a broader banking data investigation.

The main objectives became:

- Design a relational PostgreSQL database.
- Load and validate the dataset.
- Explore individual tables using SQL.
- Assess relationships between related tables.
- Determine whether the dataset supports meaningful deeper analysis.

## Technologies

- PostgreSQL
- SQL
- Linux / WSL2
- Bash
- Git & GitHub

## Project Structure

```text
project-root/
│
├── documents/
│   ├── data_exploration.md
│   ├── database_import_decisions.md
│   ├── dataset_assessment.md
│   ├── project_conclusion.md
│   ├── schema_design.md
│   └── validation_data.md
│
│
├── sql/
│   ├── data-exploration.sql
│   ├── dataset_assessment.sql
│   ├── import_data.sql
│   ├── schema.sql
│   └── validation.sql
│
└── requirements.txt
├── README.md
└── .gitignore
```

The dataset itself is excluded from Git through `.gitignore`.

## Data Validation

The database was validated for:

- Row counts
- Primary-key uniqueness
- Null primary keys
- Invalid numeric values
- Invalid categories
- Referential integrity
- Broken relationships between tables

The validation produced no significant data-integrity issues.

The validation queries are available in [`sql/validation.sql`](sql/validation.sql).

## Exploratory Analysis

Each table was explored individually to examine its distributions and identify potentially useful variables.

Examples include:

- Credit-score statistics
- Customers by city and year
- Account-type distribution
- Account balances
- Account ownership
- Loan amounts and interest rates
- Loans by year
- Transaction amounts and volume

The analysis showed that many variables contained very uniform or artificial-looking patterns, providing limited analytical value.

The exploration queries are available in [`sql/data_exploration.sql`](sql/data_exploration.sql).

## Dataset Assessment

After the individual table exploration, relationships between the tables were tested to determine whether the dataset contained meaningful business patterns.

Some key results:

| Test | Result |
|---|---:|
| Credit score vs. balance correlation | -0.004153 |
| Transaction amount vs. balance correlation | 0.000308 |
| Loan amount vs. interest rate correlation | -0.004506 |
| Has loan vs. average balance | 100,118.86 |
| No loan vs. average balance | 100,232.91 |

Account types and transaction behavior were also remarkably similar:

| Account Type | Avg Transaction | Avg Transactions / Account |
|---|---:|---:|
| Business | 5,005.21 | 13.36 |
| Checking | 4,998.14 | 13.29 |
| Savings | 4,999.12 | 13.35 |

The assessment, combined with the exploratory findings, strongly indicated that the dataset was synthetically generated and contained limited meaningful relationships.

The assessment queries are available in [`sql/dataset_assessment.sql`](sql/dataset_assessment.sql).

## Conclusion

The project was stopped before deeper visualization and feature engineering because the dataset did not provide sufficient meaningful relationships to justify them.

Rather than forcing patterns or creating artificial business insights, the project concluded that the dataset was unsuitable for deeper analytical work.

The complete reasoning is documented in [`docs/project_conclusion.md`](documents/project_conclusion.md).

## Key Learning

The main lesson from this project was that **dataset evaluation should come before deeper analysis**.

A dataset can have valid schemas, millions of records, complete primary and foreign keys, and no obvious data-quality problems while still lacking meaningful analytical signal.

This project provided practical experience with PostgreSQL database design, data loading, SQL validation, aggregation, joins, exploratory analysis, and—most importantly—evaluating whether a dataset actually supports the analysis being attempted.
