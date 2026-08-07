
-- DATA VALIDATION
-- Banking Database
-- ============================================

-- 1. ROW COUNTS

SELECT COUNT(*) AS customers FROM customers;
SELECT COUNT(*) AS accounts FROM accounts;
SELECT COUNT(*) AS loans FROM loans;
SELECT COUNT(*) AS cards FROM cards;
SELECT COUNT(*) AS merchants FROM merchants;
SELECT COUNT(*) AS transactions FROM transactions;
SELECT COUNT(*) AS branches FROM branches;

-- 2. PRIMARY KEY VALIDATION

-- Customers
SELECT COUNT(*)
FROM customers
WHERE customer_id IS NULL;

SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Accounts
SELECT COUNT(*)
FROM accounts
WHERE account_id IS NULL;

SELECT account_id, COUNT(*)
FROM accounts
GROUP BY account_id
HAVING COUNT(*) > 1;

-- Loans
SELECT COUNT(*)
FROM loans
WHERE loan_id IS NULL;

SELECT loan_id, COUNT(*)
FROM loans
GROUP BY loan_id
HAVING COUNT(*) > 1;

-- Cards
SELECT COUNT(*)
FROM cards
WHERE card_id IS NULL;

SELECT card_id, COUNT(*)
FROM cards
GROUP BY card_id
HAVING COUNT(*) > 1;

-- Merchants
SELECT COUNT(*)
FROM merchants
WHERE merchant_id IS NULL;

SELECT merchant_id, COUNT(*)
FROM merchants
GROUP BY merchant_id
HAVING COUNT(*) > 1;

-- Transactions
SELECT COUNT(*)
FROM transactions
WHERE transaction_id IS NULL;

SELECT transaction_id, COUNT(*)
FROM transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;

-- Branches
SELECT COUNT(*)
FROM branches
WHERE branch_id IS NULL;

SELECT branch_id, COUNT(*)
FROM branches
GROUP BY branch_id
HAVING COUNT(*) > 1;

-- 3. VALUE VALIDATION

-- Account Types
SELECT DISTINCT account_type
FROM accounts;

-- Card Types
SELECT DISTINCT card_type
FROM cards;

-- Credit Score Range
SELECT *
FROM customers
WHERE credit_score < 300
   OR credit_score > 850;

-- Negative Balances
SELECT *
FROM accounts
WHERE balance_usd < 0;

-- Negative Loan Amounts
SELECT *
FROM loans
WHERE loan_amount < 0;

-- Negative Transaction Amounts
SELECT *
FROM transactions
WHERE amount_usd < 0;

-- 4. REFERENTIAL INTEGRITY

-- Accounts -> Customers
SELECT COUNT(*)
FROM accounts a
LEFT JOIN customers c
ON a.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Loans -> Customers
SELECT COUNT(*)
FROM loans l
LEFT JOIN customers c
ON l.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Cards -> Accounts
SELECT COUNT(*)
FROM cards ca
LEFT JOIN accounts a
ON ca.account_id = a.account_id
WHERE a.account_id IS NULL;

-- Transactions -> Accounts
SELECT COUNT(*)
FROM transactions t
LEFT JOIN accounts a
ON t.account_id = a.account_id
WHERE a.account_id IS NULL;

-- Transactions -> Merchants
SELECT COUNT(*)
FROM transactions t
LEFT JOIN merchants m
ON t.merchant_id = m.merchant_id
WHERE m.merchant_id IS NULL;
