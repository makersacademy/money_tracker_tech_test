# Money tracker tech test

<img src="http://i.imgur.com/7dlpZgR.png" alt="Money Tracker domain model" style="width: 600px;"/>   

**User Stories**
```
As a User
So that I can track the money I spend
I want to record the exact amount and date

As a User
So that I can track the money I earn
I want to record the exact amount and date

As a User
So that I can see all records
I want to be able to print an account statement
```
## Installation

- Run `git clone https://github.com/MarySalemme/money_tracker_tech_test`
- Navigate to the repo `cd money_tracker_tech_test`
- Run `gem install bundle` from the command line
- Run `bundle`

## Usage
```
2.4.0 :001 > require './lib/tracker'
 => true
2.4.0 :002 > tracker = Tracker.new
 => #<Tracker:0x007f84fc964258 @transactions=[]>
2.4.0 :003 > transaction = Transaction.new("19/07/2017", -1400)
 => #<Transaction:0x007f84fd9301c8 @date="19/07/2017", @amount=-1400>

2.4.0 :004 > transaction1 = Transaction.new("14/07/2017", 1200)
 => #<Transaction:0x007f84fd928298 @date="14/07/2017", @amount=1200>
2.4.0 :005 > tracker.record_transaction(transaction)
 => [#<Transaction:0x007f84fd9301c8 @date="19/07/2017", @amount=-1400>]
2.4.0 :006 > tracker.record_transaction(transaction1)
 => [#<Transaction:0x007f84fd9301c8 @date="19/07/2017", @amount=-1400>, #<Transaction:0x007f84fd928298 @date="14/07/2017", @amount=1200>]
2.4.0 :007 > tracker.show_statement
 => "date || credit || debit || balance\n19/07/2017 || || 1400.00 || -1400.00\n14/07/2017 || 1200.00 || || -200.00\n"
```
