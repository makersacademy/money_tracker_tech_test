[![Build Status](https://travis-ci.org/ccfz/bank_tech_test.svg?branch=master)](https://travis-ci.org/ccfz/bank_tech_test)

# The Bank Tech Test

### Approach

* I first created the account class and started with a MVP that could add and substract amounts to a balance.

* Once I reached the user stories related to statements I created a statement class. As the printed statement will include a balance column I created a balance class and injected into the statement.

* As each transaction will consist of an amount and a date I created a  class for deposit and withdraw, which creates a timestamp and converts it into the right format. I save the raw timestamp, in case a more detailed view is wanted later on. 

* I diviated from the requirements in regards to the amount. As the table is not alligned propaberly I wanted to at least show negative values. 

### Tech

* rails
* timecop
* rspec

### Installation

* git clone repo
* bundle install

### How to use

* initialize a statement with a hash of Balance, Deposit & Withdraw
* initialiue an account with the statement object created before
* Account has four methods:
  * check_balance
  * deposit(amount)
  * withdraw(amount)
  * print_statement

### Example use:

```
require_relative 'lib/account'
require_relative 'lib/balance'
require_relative 'lib/statement'
require_relative 'lib/deposit'
require_relative 'lib/withdraw'

statement = Statement.new({balance_class:Balance,deposit_class:Deposit,withdraw_class:Withdraw}) 
my_account = Account.new({statement:statement})


puts "1) should add a balance and print it out"

my_account.deposit(100)
puts my_account.check_balance

puts "2) should show 60"
my_account.withdraw(40)
puts my_account.check_balance

puts "3 should how log of transactions"
my_account.print_statement

```

### Changes if there had be more time

* Combined deposit and withdraw class into one transaction class
* have a log consist of the transaction_class object and balance, then depending on the filter create an array with the detailed view

### User stories

```
As a User,
To manage my money,
I want to be able to see my balance.
```
```
As a User,
So that I can add money to my account,
I want to be able to deposit my money.
```
```
As a User,
So that I can pay with cash,
I want to be able to withdraw money.
```
```
As a User,
So that I can track my account,
I want to print a bank statement.
```
```
Final Format:
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

``