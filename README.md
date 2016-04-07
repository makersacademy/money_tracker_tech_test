# The Bank Tech Test [![Build Status](https://travis-ci.org/katie210/bank_tech_test.svg?branch=master)](https://travis-ci.org/katie210/bank_tech_test)

>When in doubt, go for the simplest solution

### Purpose of Project
  * 1 day build for tech test 

### Requirements

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

#### How to Use

The Bank at present is a CLI (command-line interface) toy. To use, simply:

1) Clone repository onto local machine

2) Open the interactive ruby tool and load the toy by typing the following:

```
$ irb
> require "./bank.rb"
> my_account = Bank.new
``` 
###### Note: make multiple accounts by setting a new unique_name = Bank.new


3) You then have access to following commands: 
`my_account.balance` to see your current account balance
`my_account.deposit(amount, "date")` to deposit money into your account
`my_account.withdraw(amount, "date")` to withdraw money from your account
 `my_account.print_statement` to see a printed Account Statement of your transactions

Enjoy!

xo Kait

### What's Next:
  * Refactor withdrawal and deposit methods to their own respective classes
  * Refactor print_statement to Print class
  * Improve visual layout of print_statement
