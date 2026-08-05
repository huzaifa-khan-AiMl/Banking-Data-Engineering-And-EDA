-- Load data into PostgreSQL tables
-- Run after executing schema.sql
\copy customers FROM '/tmp/customers.csv' DELIMITER ',' CSV HEADER;
\copy accounts FROM '/tmp/accounts.csv' DELIMITER ',' CSV HEADER;
\copy loans FROM '/tmp/loans.csv' DELIMITER ',' CSV HEADER;
\copy cards FROM '/tmp/cards.csv' DELIMITER ',' CSV HEADER;
\copy merchants FROM '/tmp/merchants.csv' DELIMITER ',' CSV HEADER;
\copy transactions FROM '/tmp/transactions.csv' DELIMITER ',' CSV HEADER;
\copy branches FROM '/tmp/branches.csv' DELIMITER ',' CSV HEADER;
