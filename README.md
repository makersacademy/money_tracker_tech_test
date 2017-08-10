# Money tracker tech test

To update:
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
2.4.0 :001 > require './lib/tracker.rb'
 => true
2.4.0 :002 > tracker = Tracker.new
 => #<Tracker:0x007ff4fd0e2a00 @transactions=[], @formatter=#<StatementFormatter:0x007ff4fd0e2e88>>
2.4.0 :003 > formatter = StatementFormatter.new
 => #<StatementFormatter:0x007ff4fd0da968>
2.4.0 :004 > trans1 = Transaction.new("10/08/2017", 200)
 => #<Transaction:0x007ff4fc8eafa0 @date="10/08/2017", @amount=200>

2.4.0 :005 > trans2 = Transaction.new("02/07/2017", -750)
 => #<Transaction:0x007ff4fd0cb210 @date="02/07/2017", @amount=-750>
2.4.0 :006 > trans3 = Transaction.new("25/07/2017", 1380)
 => #<Transaction:0x007ff4fc8d8170 @date="25/07/2017", @amount=1380>
2.4.0 :007 > tracker.record_transaction(trans1)
 => [#<Transaction:0x007ff4fc8eafa0 @date="10/08/2017", @amount=200>]
2.4.0 :008 > tracker.record_transaction(trans2)
 => [#<Transaction:0x007ff4fc8eafa0 @date="10/08/2017", @amount=200>, #<Transaction:0x007ff4fd0cb210 @date="02/07/2017"
, @amount=-750>]
2.4.0 :009 > tracker.record_transaction(trans3)
 => [#<Transaction:0x007ff4fc8eafa0 @date="10/08/2017", @amount=200>, #<Transaction:0x007ff4fd0cb210 @date="02/07/2017"
, @amount=-750>, #<Transaction:0x007ff4fc8d8170 @date="25/07/2017", @amount=1380>]
2.4.0 :010 > tracker.show_statement
 => "date || earning || spending || balance\n10/08/2017 || 200.00 || || 200.00\n02/07/2017 || || 750.00 || -550.00\n25/
07/2017 || 1380.00 || || 830.00\n"
```
