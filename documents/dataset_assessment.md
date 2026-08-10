# Dataset Assessment

## Purpose

The purpose of this assessment was to determine whether the banking
dataset contains meaningful relationships between variables across
multiple tables, beyond the single-table exploration already performed.

The assessment focuses on business-oriented relationships rather than
simply calculating additional descriptive statistics.

------------------------------------------------------------------------

## 1. Credit Score vs Account Balance

**Question:** Does a customer's credit score have a meaningful
relationship with the balance held in their accounts?

**Result:** Correlation = **-0.004153**

**Interpretation:** The correlation is extremely close to zero,
indicating essentially no linear relationship between credit score and
account balance in this dataset.

------------------------------------------------------------------------

## 2. Loan Ownership vs Account Balance

**Question:** Do customers with loans maintain different average account
balances compared with customers without loans?

  Loan Status     Average Balance
  ------------- -----------------
  Has Loan             100,118.86
  No Loan              100,232.91

**Interpretation:** The two groups have very similar average balances.
The difference is approximately \$114, which is very small relative to
an average balance of around \$100,000. This suggests that loan
ownership does not have a meaningful relationship with account balance
in this dataset.

------------------------------------------------------------------------

## 3. Account Type vs Transaction Behavior

**Question:** Does account type affect transaction behavior, considering
both transaction amount and transaction frequency?

  -----------------------------------------------------------------------
  Account Type              Average Transaction  Average Transactions per
                                         Amount                   Account
  ------------------- ------------------------- -------------------------
  Business                             5,005.21                     13.36

  Checking                             4,998.14                     13.29

  Savings                              4,999.12                     13.35
  -----------------------------------------------------------------------

**Interpretation:** The three account types show extremely similar
transaction behavior. Average transaction amounts are all approximately
\$5,000, while average transaction frequency is approximately 13.3
transactions per account. There is therefore little observable variation
in transaction behavior based on account type.

------------------------------------------------------------------------

## 4. Card Type vs Account Balance

**Question:** Does having a credit card versus a debit card correspond
to a meaningful difference in account balance?

  Card Type     Average Balance
  ----------- -----------------
  Credit              99,941.22
  Debit              100,643.11

**Interpretation:** The average balances are again very close. The
difference is approximately \$702, which is small compared with balances
around \$100,000. This provides little evidence of a meaningful
relationship between card type and account balance.

------------------------------------------------------------------------

## 5. Transaction Amount vs Account Balance

**Question:** Is the amount of a transaction related to the balance of
the account used for that transaction?

**Result:** Correlation = **0.000308**

**Interpretation:** The correlation is effectively zero, indicating no
meaningful linear relationship between account balance and transaction
amount.

------------------------------------------------------------------------

## 6. Loan Amount vs Interest Rate

**Question:** Does the size of a loan have a meaningful relationship
with its interest rate?

**Result:** Correlation = **-0.004506**

**Interpretation:** The correlation is extremely close to zero. This
indicates essentially no linear relationship between loan amount and
interest rate in the dataset.

------------------------------------------------------------------------

# Overall Findings

The six cross-table tests produced a consistent pattern:

-   Credit score vs account balance: **-0.004153**
-   Loan ownership vs account balance: **very similar group averages**
-   Account type vs transaction behavior: **very similar group
    averages**
-   Card type vs account balance: **very similar group averages**
-   Transaction amount vs account balance: **0.000308**
-   Loan amount vs interest rate: **-0.004506**

The results show that the variables tested are remarkably uniform and
that the expected business relationships are either extremely weak or
not observable in the available data.

This is important because the analysis did not simply stop after failing
to find an interesting relationship. Multiple relationships were
explicitly tested across the database, including relationships involving
customers, accounts, loans, cards, and transactions.

## Conclusion

The dataset does not provide strong evidence of meaningful relationships
between the tested business variables.

The results are consistent with a highly uniform or artificially
generated dataset. However, these SQL tests **do not independently prove
that the dataset is synthetic**. The conclusion should be based on the
combined evidence from:

1.  Data validation
2.  Single-table exploration
3.  Cross-table relationship testing
4.  The overall uniformity observed throughout the dataset

Therefore, the appropriate conclusion is that **the dataset appears
highly synthetic or artificially structured and does not contain enough
meaningful variation for a deeper business-oriented banking analysis
based on the tested relationships.**

This assessment provides the evidence needed to justify limiting further
analysis rather than continuing to manufacture business insights from
relationships that are not supported by the data.
