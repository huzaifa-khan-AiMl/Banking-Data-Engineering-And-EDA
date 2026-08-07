-- == Customers Table Exploration ==

---------------------------------------------
-- Total customers
---------------------------------------------
SELECT COUNT(*) FROM customers;

-- Credit score statistics
SELECT MIN(credit_score),
       MAX(credit_score),
       AVG(credit_score)
FROM customers;

-- Customers per city
SELECT city, COUNT(*)
FROM customers
GROUP BY city
ORDER BY COUNT(*) DESC;

-- New customers by year
SELECT EXTRACT(YEAR FROM created_at) AS year,
       COUNT(*)
FROM customers
GROUP BY year
ORDER BY year;

-- Cities Count:
SELECT COUNT(DISTINCT city)
FROM customers;


---------------------------------------------
-- ACCOUNTS TABLE
---------------------------------------------

-- Total number of accounts
SELECT COUNT(*) AS total_accounts
FROM accounts;

-- Distribution of account types
SELECT
    account_type,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY account_type
ORDER BY total_accounts DESC;

-- Average account balance
SELECT
    ROUND(AVG(balance_usd),2) AS average_balance_usd
FROM accounts;

-- Average balance by account opening year
SELECT
    EXTRACT(YEAR FROM open_date) AS year,
    ROUND(AVG(balance_usd),2) AS average_balance
FROM accounts
GROUP BY EXTRACT(YEAR FROM open_date)
ORDER BY year;

-- Number of customers by account ownership
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

-- Customers having more than one account
SELECT COUNT(*) AS customers_with_multiple_accounts
FROM
(
    SELECT
        customer_id
    FROM accounts
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) multiple_accounts;
