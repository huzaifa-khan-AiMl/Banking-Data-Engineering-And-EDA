\echo '================= DATASET ASSESSMENT =================='
\echo ''
\echo 'Tests whether relationships exist between business'
\echo 'variables, beyond what single-table exploration showed.'

\echo ''
\echo '---------------------------------------------'
\echo '1. Credit score vs balance (correlation)'
SELECT ROUND(CORR(c.credit_score, a.balance_usd)::NUMERIC, 6) AS credit_balance_corr
FROM customers c JOIN accounts a ON c.customer_id = a.customer_id;

\echo ''
\echo '---------------------------------------------'
\echo '2. Loan ownership vs balance'
SELECT
    CASE WHEN EXISTS (SELECT 1 FROM loans l WHERE l.customer_id = c.customer_id)
         THEN 'Has Loan' ELSE 'No Loan' END AS loan_status,
    ROUND(AVG(a.balance_usd), 2) AS avg_balance
FROM customers c JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY loan_status;

\echo ''
\echo '---------------------------------------------'
\echo '3. Account type vs transaction behavior (amount AND frequency together'
SELECT
    a.account_type,
    ROUND(AVG(t.amount_usd), 2) AS avg_amount,
    ROUND(COUNT(*)::NUMERIC / COUNT(DISTINCT a.account_id), 2) AS avg_txns_per_account
FROM accounts a JOIN transactions t ON a.account_id = t.account_id
GROUP BY a.account_type;

\echo ''
\echo '---------------------------------------------'
\echo '4. Card type vs balance'
SELECT ca.card_type, ROUND(AVG(a.balance_usd), 2) AS avg_balance
FROM cards ca JOIN accounts a ON ca.account_id = a.account_id
GROUP BY ca.card_type;

\echo ''
\echo '---------------------------------------------'
\echo '5. Transaction amount vs account balance (correlation)'
SELECT ROUND(CORR(a.balance_usd, t.amount_usd)::NUMERIC, 6) AS balance_amount_corr
FROM accounts a JOIN transactions t ON a.account_id = t.account_id;

\echo ''
\echo '---------------------------------------------'
\echo '6. Loan amount vs interest rate (correlation)'
SELECT ROUND(CORR(loan_amount, interest_rate)::NUMERIC, 6) AS loan_interest_corr
FROM loans;

\echo ''
\echo '=== NOTE =='
\echo 'These tests evaluate uniformity and relationships'
\echo 'within the dataset. Results should be interpreted'
\echo 'together; they do not independently prove that'
\echo 'the dataset is synthetic.'
