-- == Customers Table Exploration ==

---------------------------------------------
-- Customers Table
---------------------------------------------
SELECT COUNT(*) FROM customers;

-- 1. Credit score statistics
SELECT MIN(credit_score),
       MAX(credit_score),
       AVG(credit_score)
FROM customers;

-- 2. Customers per city
SELECT city, COUNT(*)
FROM customers
GROUP BY city
ORDER BY COUNT(*) DESC;

-- 3. New customers by year
SELECT EXTRACT(YEAR FROM created_at) AS year,
       COUNT(*)
FROM customers
GROUP BY year
ORDER BY year;

-- 4. Cities Count:
SELECT COUNT(DISTINCT city)
FROM customers;


---------------------------------------------
-- ACCOUNTS TABLE
---------------------------------------------

-- 1. Total number of accounts
SELECT COUNT(*) AS total_accounts
FROM accounts;

-- 2. Distribution of account types
SELECT
    account_type,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY account_type
ORDER BY total_accounts DESC;

-- 3. Average account balance
SELECT
    ROUND(AVG(balance_usd),2) AS average_balance_usd
FROM accounts;

-- 4. Average balance by account opening year
SELECT
    EXTRACT(YEAR FROM open_date) AS year,
    ROUND(AVG(balance_usd),2) AS average_balance
FROM accounts
GROUP BY EXTRACT(YEAR FROM open_date)
ORDER BY year;

-- 5. Number of customers by account ownership
SELECT
    total_accounts,
    COUNT(*) AS customers
FROM
(
    SELECT
        customer_id,
        COUNT(*) AS total_accounts
    FROM accounts
    GROUP BY customer_id
) account_distribution
GROUP BY total_accounts
ORDER BY total_accounts DESC;

-- 6. Customers having more than one account
SELECT COUNT(*) AS customers_with_multiple_accounts
FROM
(
    SELECT
        customer_id
    FROM accounts
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) multiple_accounts;
-- 7. Avg, Max and Min Balance by Type of the Account
SELECT
    account_type AS type,
    MAX(balance_usd) AS max_balance,
    MIN(balance_usd) AS min_balance,
    AVG(balance_usd) AS avg_balance
FROM accounts
GROUP BY account_type
ORDER BY type;

-- ---------------------------------------------------
-- Loan Table:
-- ---------------------------------------------------

-- 1. Loan amount statistics
SELECT
    MAX(loan_amount) AS max_loan,
    MIN(loan_amount) AS min_loan,
    AVG(loan_amount) AS avg_loan,
    PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY loan_amount) AS median_loan
FROM loans;


-- 2. Interest rate statistics
SELECT
    MAX(interest_rate) AS max_interest_rate,
    MIN(interest_rate) AS min_interest_rate,
    AVG(interest_rate) AS avg_interest_rate
FROM loans;


-- 3. Average interest rate by loan amount range
SELECT
    CASE
        WHEN loan_amount < 50000 THEN 'Under 50K'
        WHEN loan_amount < 100000 THEN '50K-100K'
        WHEN loan_amount < 150000 THEN '100K-150K'
        WHEN loan_amount < 200000 THEN '150K-200K'
        ELSE '200K+'
    END AS loan_range,
    AVG(interest_rate) AS avg_interest_rate
FROM loans
GROUP BY loan_range
ORDER BY loan_range;


-- 4. Average loan amount and interest rate by year
SELECT
    AVG(loan_amount) AS avg_loan_amount,
    AVG(interest_rate) AS avg_interest_rate,
    EXTRACT(YEAR FROM start_date) AS years
FROM loans
GROUP BY years
ORDER BY years;


-- 5. Number of unique customers who have taken loans
SELECT COUNT(DISTINCT customer_id)
FROM loans;


-- 6. Average number of loans per borrowing customer
SELECT
    COUNT(loan_amount)::DECIMAL
    / COUNT(DISTINCT customer_id) AS avg_loans_per_customer
FROM loans;


-- 7. Number of loans issued by year
SELECT
    COUNT(loan_amount) AS loan_count,
    EXTRACT(YEAR FROM start_date) AS years
FROM loans
GROUP BY years
ORDER BY years;


-- 8. Overall loan distribution
SELECT
    CASE
        WHEN loan_amount <= 200000 THEN 'Under/Equal 200K'
        WHEN loan_amount <= 220000 THEN '200K-220K'
        WHEN loan_amount <= 240000 THEN '220K-240K'
        WHEN loan_amount <= 260000 THEN '240K-260K'
        WHEN loan_amount <= 280000 THEN '260K-280K'
        ELSE '280K+'
    END AS loan_range,
    COUNT(loan_amount) AS loan_count
FROM loans
GROUP BY loan_range
ORDER BY loan_range;
