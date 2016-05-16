# The Bank Tech Test

This tech test is a practice run during the last week of the Makers Academy course, in preparation for real world tech tests.

To solve this test, the code has been broken down into four objects, an Account, a Transaction, Transaction History and Statement, which in combination allow for deposits and withdrawals to be made, and statements to be printed in reverse chronological order.

In order to run the feature test in the command line, make sure you have ruby 2.2.3 installed on your computer. To double check your Ruby version with RVM run:

`rvm list`

If you're running on a different version of Ruby, run

`rvm install ruby 2.2.3`

Clone this repo into a folder of your choosing.
Then, to see the requirements below fulfilled, within the root run

`ruby spec/feature_spec.rb`

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

### Additional extensions

* Statement filters (just deposits, withdrawals, date ascending, date descending)
* Graphical interface
