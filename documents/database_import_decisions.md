# Database Imports Decisions

## Issues Encountered and there Solutions:

### Transactions csv file Issue:
The dataset contained transactions.sql but did not include transactions.csv. Therefore, I converted the SQL insert statements into a CSV file using the Linux sed command.

### Running file in Postgres User Issue:
- Second issue encountered was that PostgreSQL runs under the `postgres` user, not my Linux user account and my project directory was in /home/huzaifa_void/ so the linux 
restricted permissions to access these files to run
- In order to solve this problem I first copied the csv files into /tmp folder shared temporary directory that is accessible to both my Linux user and the PostgreSQL
and also store files for both of them temprorily and than I ran that file path in my database under the `postgres` user

### Transactions csv file not loading:
- All the datasets loaded with ease following using same tmp technique except the transactions.sql because During import, PostgreSQL reported that the foreign key account_id
did not exist in the accounts table. Investigation showed that every value in transactions.csv contained a leading space after each comma, so PostgreSQL treated " ACC..." from 
transactions as a different value from "ACC... from accounts.csv". maybe because during the extraction from sql files the spaces might got skipped so I again used sed command 
again `sed -i 's/, /,/g' transactions.csv` to resolve the issue and than the data was loaded with no error.

## Data Loading Order:
The import order matters because of foreign key constraints.

Order used:

1. customers
2. accounts
3. loans
4. cards
5. merchants
6. transactions
7. branches

Transactions must be loaded after merchants and accounts because it references both tables.

# Result

✓ Schema created successfully.
✓ All seven tables imported successfully.
✓ Foreign key relationships verified.
