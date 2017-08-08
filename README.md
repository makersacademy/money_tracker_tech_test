# Money tracker tech test

## Specification

### Requirements

* You should be able to interact with the your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)

* You should be able to record money you've spent and the date you spent it on.  e.g. You could record the fact that you spent £100 on 2017/8/8.

* You should be able to record money you've earned and the date you earned it on.  e.g. You could record the fact that you earned £100 on 2017/8/8.

* You should be able to print an account statement that shows all the records (date, amount, balance).

* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** you record that you earned 1000 on 10-01-2012
**And** earned 2000 on 13-01-2012
**And** spent 500 on 14-01-2012
**When** you print your bank statement
**Then** you would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

#### User Stories

```
As someone with an account,
So that I can save,
I can deposit money
```
```
As someone with an account,
So that I can spend,
I can withdraw money
```
```
As someone with an account,
So I know my account history,
I can see a printed statement
```
```
As someone with an account,
So I track debits and credits,
I can see relevant dates on my statement
```

#### Approach

Four classes: account, statement, transaction, and transaction log. To be elaborate on.

#### IRB Example

```
2.3.3 :002 > bank = Bank.new
 => #<Bank:0x007ff3c3854d78 @transactions_log=#<Transactions_Log:0x007ff3c3854d50 @transaction=Transaction, @history=[]>, @balance=0>
2.3.3 :003 > bank.deposit(50)
 => [#<Transaction:0x007ff3c38403f0 @credit=50, @debit=0, @time=2017-08-08 12:24:08 +0100, @balance=50>]
2.3.3 :004 > bank.withdraw(10)
 => [#<Transaction:0x007ff3c38403f0 @credit=50, @debit=0, @time=2017-08-08 12:24:08 +0100, @balance=50>, #<Transaction:0x007ff3c3833b78 @credit=0, @debit=10, @time=2017-08-08 12:24:17 +0100, @balance=40>]
2.3.3 :005 > bank.deposit(1000)
 => [#<Transaction:0x007ff3c38403f0 @credit=50, @debit=0, @time=2017-08-08 12:24:08 +0100, @balance=50>, #<Transaction:0x007ff3c3833b78 @credit=0, @debit=10, @time=2017-08-08 12:24:17 +0100, @balance=40>, #<Transaction:0x007ff3c38a8978 @credit=1000, @debit=0, @time=2017-08-08 12:24:22 +0100, @balance=1040>]
2.3.3 :006 > bank.get_statement
 date | credit | debit | balance
 /08/08/17 | 1000 | 0 | 1040
 /08/08/17 | 0 | 10 | 40
 /08/08/17 | 50 | 0 | 50
```
