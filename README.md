# The Bank Tech Test

>When in doubt, go for the simplest solution

[![Build Status](https://travis-ci.org/innlouvate/bank_tech_test.svg?branch=master)](https://travis-ci.org/innlouvate/bank_tech_test)
[![Coverage Status](https://coveralls.io/repos/github/innlouvate/bank_tech_test/badge.svg?branch=master)](https://coveralls.io/github/innlouvate/bank_tech_test?branch=master)

### To generate the statement in the requirements below, clone this repo and run the following commands in irb;
'''
require './lib/account.rb'
account = Account.new
account.deposit(1000, Time.new(2012, 01, 10))
account.deposit(2000, Time.new(2012, 01, 13))
account.withdraw(500, Time.new(2012, 01, 14))
account.print_statement
account.print_statement('deposit')
'''


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
