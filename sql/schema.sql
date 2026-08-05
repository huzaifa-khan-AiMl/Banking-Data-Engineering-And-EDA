--                                                   =====Banking Database Schema====
--                                                            (Postgresql)
-- Banking database schema designed from the provided CSV datasets.
-- Includes the transactions table reconstructed from transactions_inserts.sql.

-- Customers Table
CREATE TABLE customers (
                       customer_id VARCHAR(20) PRIMARY KEY,
                       first_name VARCHAR(50),
                       last_name VARCHAR(50),
                       email VARCHAR(100),
                       city VARCHAR(50),
                       credit_score INT,
                       created_at DATE
);

-- Accounts Table
CREATE TABLE accounts (
                      account_id VARCHAR(20) PRIMARY KEY,
                      customer_id VARCHAR(20),
                      account_type VARCHAR(20),
                      balance_usd DECIMAL(12,2),
                      open_date DATE,
                      FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- Loans Table
CREATE TABLE loans (
                    loan_id VARCHAR(20) PRIMARY KEY,
                    customer_id VARCHAR(20),
                    loan_amount DECIMAL(12,2),
                    interest_rate DECIMAL(5,2),
                    start_date DATE,
                    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- Cards Table

CREATE TABLE cards (
                   card_id VARCHAR(20) PRIMARY KEY,
                   account_id VARCHAR(20),
                   card_type VARCHAR(20),
                   expiration_date DATE,
                   FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- Merchant Table
CREATE TABLE merchants (
                       merchant_id VARCHAR(20) PRIMARY KEY,
                       merchant_name VARCHAR(100),
                       city VARCHAR(50)
);

-- Transactions Table
CREATE TABLE transactions (
                          transaction_id VARCHAR(25) PRIMARY KEY,
                          account_id VARCHAR(20),
                          merchant_id VARCHAR(20),
                          amount_usd DECIMAL(12,2),
                          transaction_date TIMESTAMP,
                          FOREIGN KEY (account_id) REFERENCES accounts(account_id),
                          FOREIGN KEY (merchant_id) REFERENCES merchants(merchant_id)
);

-- Branches Table
CREATE TABLE branches (
                      branch_id VARCHAR(20) PRIMARY KEY,
                      branch_name VARCHAR(100),
                      manager_name VARCHAR(100)
);
