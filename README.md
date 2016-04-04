# bank-tech-test

![alt text](https://travis-ci.org/tsetsova/bank_tech_test.svg?branch=master "Travis Badge")

## Where I got to

* I have two classes - account and statement
* Formatting works correctly
* Done TDD, dependency has been mocked

## To use in irb

* require_relative 'lib/account.rb'
 => true
* account = Account.new
 => #<Account:0x007f9cbb9f4a70 @balance=0, @statements=#<Statements:0x007f9cbb9f4a20 @collection=[]>>

* account.balance
 => 0

* account.print_statements
 => "No statements available"

* account.deposit(100)
 => 100

* account.withdraw(140)
RuntimeError: You can only withdraw 100.

* account.withdraw(90)
 => 10

* account.balance
 => 10

* account.print_statements
date || credit || debit || balance
04/04/16 || 100.00 ||  || 0.00
04/04/16 ||  || 90.00 || 100.00



