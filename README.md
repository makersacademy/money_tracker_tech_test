
# The Bank Tech Test

[![Build Status](https://travis-ci.org/seanhawkridge/bank_tech_test.svg?branch=master)](https://travis-ci.org/seanhawkridge/bank_tech_test)

# My Approach

I started by doing some simple domain modeling to sketch out the objects and messages I thought the domain would use in its simplest form. I then TDD'd the project, starting with an account class to handle credits, debits and the balance. I then refactored out a transaction class to handle each transaction. All of the transactions are stored in an array in the Account class.

# Usage

In IRB/PRY:

````
[1] pry(main)> require './lib/account.rb'
=> true
[2] pry(main)> a = Account.new
=> #<Account:0x007fe03c4eaad8 @balance=0, @statement=[], @transaction_klass=Transaction>
[3] pry(main)> a.credit(date: "1/2/12", amount:30)
=> [#<Transaction:0x007fe03c473910 @balance=30, @credit=30, @date="1/2/12", @debit=nil>]
[4] pry(main)> a.debit(date: "4/3/12", amount: 120)
=> [#<Transaction:0x007fe03c473910 @balance=30, @credit=30, @date="1/2/12", @debit=nil>,
 #<Transaction:0x007fe03c3f10a0 @balance=-90, @credit=nil, @date="4/3/12", @debit=120>]
[5] pry(main)> a.credit(date: "6/3/12", amount:250)
=> [#<Transaction:0x007fe03c473910 @balance=30, @credit=30, @date="1/2/12", @debit=nil>,
 #<Transaction:0x007fe03c3f10a0 @balance=-90, @credit=nil, @date="4/3/12", @debit=120>,
 #<Transaction:0x007fe03c311568 @balance=160, @credit=250, @date="6/3/12", @debit=nil>]
[6] pry(main)> a.debit(date: "7/3/12", amount: 160)
=> [#<Transaction:0x007fe03c473910 @balance=30, @credit=30, @date="1/2/12", @debit=nil>,
 #<Transaction:0x007fe03c3f10a0 @balance=-90, @credit=nil, @date="4/3/12", @debit=120>,
 #<Transaction:0x007fe03c311568 @balance=160, @credit=250, @date="6/3/12", @debit=nil>,
 #<Transaction:0x007fe03c1d38b8 @balance=0, @credit=nil, @date="7/3/12", @debit=160>]
[7] pry(main)> a.balance
=> 0
[8] pry(main)> a.print_statement
"date || credit || debit || balance"
"7/3/12 ||  || 160.00 || 0.00"
"6/3/12 || 250.00 ||  || 160.00"
"4/3/12 ||  || 120.00 || -90.00"
"1/2/12 || 30.00 ||  || 30.00"
=> ["7/3/12 ||  || 160.00 || 0.00",
 "6/3/12 || 250.00 ||  || 160.00",
 "4/3/12 ||  || 120.00 || -90.00",
 "1/2/12 || 30.00 ||  || 30.00"]
[9] pry(main)>

````

>When in doubt, go for the simplest solution

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
