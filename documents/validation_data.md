# Validation of the Database
The SQL queries in `validation.sql` were executed to validate the imported banking dataset.

## 1. Row Count Validation

| Table | Rows |
|-------|------:|
| Customers | 50,000 |
| Accounts | 75,000 |
| Loans | 30,000 |
| Cards | 100,000 |
| Merchants | 5,000 |
| Transactions | 1,000,000 |
| Branches | 500 |

- All row counts matched the original CSV files, confirming that every record was successfully imported.

---


## 2. Primary Key Validation

The following checks were performed for every table:

- Missing (NULL) primary keys
- Duplicate primary keys

| Primary Key | Status |
|-------------|--------|
| customer_id | ✅ No NULL values, No duplicates |
| account_id | ✅ No NULL values, No duplicates |
| loan_id | ✅ No NULL values, No duplicates |
| card_id | ✅ No NULL values, No duplicates |
| merchant_id | ✅ No NULL values, No duplicates |
| transaction_id | ✅ No NULL values, No duplicates |
| branch_id | ✅ No NULL values, No duplicates |

> Although PostgreSQL enforces primary key constraints during data import, these validation queries were executed to verify the integrity of the imported dataset.

---


## 3. Value Validation

### Distinct Categories

**Account Types**

- Checking
- Savings
- Business

**Card Types**

- Credit
- Debit

### Valid Value Checks

- Credit scores fall within the expected range (300–850).
- No negative account balances were found.
- No negative loan amounts were found.
- No negative transaction amounts were found.

---


## 4. Referential Integrity Validation

Foreign key relationships were validated using `LEFT JOIN` queries.

| Relationship | Status |
|--------------|--------|
| Accounts → Customers | ✅ Valid |
| Loans → Customers | ✅ Valid |
| Cards → Accounts | ✅ Valid |
| Transactions → Accounts | ✅ Valid |
| Transactions → Merchants | ✅ Valid |

All validation queries returned zero orphan records, confirming that every foreign key references an existing primary key.

---


# Summary

The dataset successfully passed all validation checks.

The validation confirmed:

- All expected rows were imported successfully.
- No missing or duplicate primary keys exist.
- Value ranges and categories are valid.
- No invalid negative numeric values were found.
- All foreign key relationships are consistent.

Overall, the dataset is clean, internally consistent, and ready for exploratory data analysis (EDA).
