\pset pager off

\echo ''-- == Customers Table Exploration ==

\echo ''
\echo '---------------------------------------------'
\echo 'Customers Table'
\echo '---------------------------------------------'

\echo ''
\echo '1: Number of Customers'
\echo ''
SELECT COUNT(*) FROM customers;

\echo ''
\echo '2: Credit score statistics'
\echo ''
SELECT MIN(credit_score),
       MAX(credit_score),
       AVG(credit_score)
FROM customers;

\echo ''
\echo '3. New customers by year'
\echo ''
SELECT EXTRACT(YEAR FROM created_at) AS year,
       COUNT(*)
FROM customers
GROUP BY year
ORDER BY year;

\echo ''
\echo '4. Cities Count'
\echo ''
SELECT COUNT(DISTINCT city)
FROM customers;

\echo ''
\echo '---------------------------------------------'
\echo 'Accounts Table'
\echo '---------------------------------------------'

\echo ''
\echo '1. Total number of accounts'
\echo ''
SELECT COUNT(*) AS total_accounts
FROM accounts;

\echo ''
\echo '2. Distribution of account types'
\echo ''
SELECT
    account_type,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY account_type
ORDER BY total_accounts DESC;

\echo ''
\echo '3. Average account balance'
\echo ''
SELECT
    ROUND(AVG(balance_usd),2) AS average_balance_usd
FROM accounts;

\echo ''
\echo '4. Average balance by account opening year'
\echo ''
SELECT
    EXTRACT(YEAR FROM open_date) AS year,
    ROUND(AVG(balance_usd),2) AS average_balance
FROM accounts
GROUP BY EXTRACT(YEAR FROM open_date)
ORDER BY year;

\echo ''
\echo '5. Number of customers by account ownership'
\echo ''
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

\echo ''
\echo '6. Customers having more than one account'
\echo ''
SELECT COUNT(*) AS customers_with_multiple_accounts
FROM
(
    SELECT
        customer_id
    FROM accounts
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) multiple_accounts;

\echo ''
\echo '7. Avg, Max and Min Balance by Type of the Account'
\echo ''
SELECT
    account_type AS type,
    MAX(balance_usd) AS max_balance,
    MIN(balance_usd) AS min_balance,
    AVG(balance_usd) AS avg_balance
FROM accounts
GROUP BY account_type
ORDER BY type;

\echo ''
\echo '---------------------------------------------'
\echo 'Loans Table'
\echo '---------------------------------------------'

\echo ''
\echo '1. Loan amount statistics'
\echo ''
SELECT
    MAX(loan_amount) AS max_loan,
    MIN(loan_amount) AS min_loan,
    AVG(loan_amount) AS avg_loan,
    PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY loan_amount) AS median_loan
FROM loans;

\echo ''
\echo '2. Interest rate statistics'
\echo ''
SELECT
    MAX(interest_rate) AS max_interest_rate,
    MIN(interest_rate) AS min_interest_rate,
    AVG(interest_rate) AS avg_interest_rate
FROM loans;

\echo ''
\echo '3. Average interest rate by loan amount range'
\echo ''
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

\echo ''
\echo '4. Average loan amount and interest rate by year'
\echo ''
SELECT
    AVG(loan_amount) AS avg_loan_amount,
    AVG(interest_rate) AS avg_interest_rate,
    EXTRACT(YEAR FROM start_date) AS years
FROM loans
GROUP BY years
ORDER BY years;

\echo ''
\echo '5. Number of unique customers who have taken loans'
\echo ''
SELECT COUNT(DISTINCT customer_id)
FROM loans;

\echo ''
\echo '6. Average number of loans per borrowing customer'
\echo ''
SELECT
    COUNT(loan_amount)::DECIMAL
    / COUNT(DISTINCT customer_id) AS avg_loans_per_customer
FROM loans;

\echo ''
\echo '7. Number of loans issued by year'
\echo ''
SELECT
    COUNT(loan_amount) AS loan_count,
    EXTRACT(YEAR FROM start_date) AS years
FROM loans
GROUP BY years
ORDER BY years;

\echo ''
\echo '8. Overall loan distribution over 200k'
\echo ''
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

\echo ''
\echo '---------------------------------------------'
\echo 'Cards Table'
\echo '---------------------------------------------'

\echo ''
\echo '1. Number of Cards'
\echo ''
SELECT COUNT(*) FROM cards;

\echo ''
\echo '2. Distribution of Card Types'
\echo ''
SELECT
    card_type,
    COUNT(*) AS total_cards
FROM cards
GROUP BY card_type
ORDER BY total_cards DESC;

\echo ''
\echo '3. Average Expiration Year by Card Type'
\echo ''
SELECT
    card_type,
    AVG(EXTRACT(YEAR FROM expiration_date)) AS average_expiration_year
FROM cards
GROUP BY card_type;

\echo ''
\echo '---------------------------------------------'
\echo 'Transactions Table'
\echo '---------------------------------------------'

\echo ''
\echo '1. Transaction Amount Statistics'
\echo ''
SELECT
    MAX(amount_usd) AS max_amount,
    MIN(amount_usd) AS min_amount,
    AVG(amount_usd) AS avg_amount,
    PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY amount_usd) AS median
FROM transactions;

\echo ''
\echo '2. Transaction Activity by Year'
\echo ''
SELECT
    EXTRACT(YEAR FROM transaction_date) AS year,
    COUNT(*) AS transactions,
    ROUND(SUM(amount_usd), 2) AS total_amount,
    ROUND(AVG(amount_usd), 2) AS avg_amount
FROM transactions
GROUP BY year
ORDER BY year;

\echo ''
\echo '---------------------------------------------'
\echo 'Merchants Table'
\echo '---------------------------------------------'

\echo ''
\echo '1. Number of Unique Merchant Cities'
\echo ''
SELECT COUNT(DISTINCT city) AS unique_cities
FROM merchants;
