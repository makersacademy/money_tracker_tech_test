# The Bank Tech Test

[![Build Status](https://travis-ci.org/harrim91/bank_tech_test.svg?branch=master)](https://travis-ci.org/harrim91/bank_tech_test)

### Requirements
* Deposits, withdrawal
* Account statement (date, amount, balance)
* Statement printing

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see


```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

Simple bank app build in AngularJS. Transaction objects have a credit and a debit attribute. When making deposits and withdrawals, one is set to 0, the other to the amount being deposited/withdrawn. The resulting transaction object is stored in an array in the statement controller via a service. This data is shown in the statement view using ng-repeat. The running balance totals are calculated as the data is displayed, and is not stored anywhere.
