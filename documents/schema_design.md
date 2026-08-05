# Schema Design and Design Decisions

## Goal: Create the PostgreSQL schema from the provided CSV files.

## Decisions:

- The dataset initially provided six CSV files. However, the SQL scripts contained a seventh table (transactions). Therefore, the transactions SQL insert script was converted 
into a CSV using the Linux `sed` command.
- After obtaining all seven CSV files, each dataset was inspected to identify relationships between tables and determine suitable primary keys and foreign keys.

## Relationships discovered

customers
    |
    +---- accounts
    |         |
    |         +---- cards
    |         |
    |         +---- transactions
    |
    +---- loans

transactions
      |
      +---- merchants

branches
(isolated)

## Relationship

- The `customer_id` column appears in the customers, accounts, and loans tables. Therefore, `customer_id` was selected as the primary key of the customers table and as a 
foreign key in the accounts and loans tables.

- The `account_id` column appears in the accounts, cards, and transactions tables. Therefore, `account_id` was selected as the primary key of the accounts table and as a 
foreign key in the cards and transactions tables.

- The `merchant_id` column appears in both the merchants and transactions tables. Therefore, `merchant_id` was selected as the primary key of the merchants table and as a 
foreign key in the transactions table. As a result, the transactions table contains two foreign keys: `account_id` and `merchant_id`.

- The branches table does not share any common identifiers with the other tables. Therefore, it remains an isolated table without foreign key relationships.

## Outcome

- Designed a normalized PostgreSQL schema from raw datasets.
- Identified primary and foreign key relationships.
- Created seven relational tables.
- Successfully executed the schema in PostgreSQL.
