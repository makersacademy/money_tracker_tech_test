
# Money tracker tech test

[![Build Status](https://travis-ci.org/Corina/money_tracker_tech_test.svg?branch=master)](https://travis-ci.org/Corina/money_tracker_tech_test)
[![Coverage Status](https://coveralls.io/repos/github/Corina/money_tracker_tech_test/badge.svg?branch=master)](https://coveralls.io/github/Corina/money_tracker_tech_test?branch=master)

## Synopsis

Money tracker is a Node.js app that helps users keep track of money spent and earned.

## User stories

**As a user**,

So I can manage my money,  
I want to open an account

So I can know what I spent,   
I want to be able to record money spent from my account

So I can know what I earned,  
I want to be able to record money deposited on my account

So I know what transactions took place on my account,  
I want to be able to see a list of transactions

So I know when each transaction took place,  
I want to see the list of transactions and the date when each took place

## Built

Built using Node.js.

## Testing

Tested using Jasmine. Added a custom_reporter.js file to customize testing output, making text from `describe` and `it` blocks visible and adding indentation.

![id](https://raw.githubusercontent.com/Corina/money_tracker_tech_test/master/assets/images/Screen%20Shot%202017-08-07%20at%2011.24.58%20PM.png)


## Installation
Clone this repo. Run examples from `usageExamples.js` by typing `node usageExamples.js`. Type `node` to access the REPL environment and play with the program.
To run tests type `jasmine` in the command line.

![id](https://raw.githubusercontent.com/Corina/money_tracker_tech_test/master/assets/images/Screen%20Shot%202017-08-08%20at%201.10.18%20PM.png)

## Approach

The purpose of the program is to retroactively keep track of transactions. I created an Account object and users can interact with it through `madeDeposit` and `withdrewMoney` functions. Each call triggers another function, `recordTransaction` which creates a new instance of a Transaction object and appends it to the account's `transactions` list.

Transactions don't need to be added in chronological order, the program takes care to sort them.

The date is converted into a Date object before being saved, making sorting chronological possible. Sorting is needed before adding the balance to each transaction. Before printing the date is converted back to string so input and output date look the same.

The `Printer` object prints the list of transactions to the console using a suite of formatting functions found in the `Formatter` module.


## Specification

### Requirements

* Your goal is to write a program you could use to track money you spend and earn.

* You should be able to interact with the your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)

* You should be able to record money you've spent and the date you spent it on.  e.g. You could record the fact that you spent £100 on 2017/8/8.

* You should be able to record money you've earned and the date you earned it on.  e.g. You could record the fact that you earned £100 on 2017/8/8.

* You should be able to print a list of all the records (date, amount, balance).

* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** you record that you earned 1000 on 10-01-2012
**and** earned 2000 on 13-01-2012
**and** spent 500 on 14-01-2012
**when** you print all your records
**then** you would see:

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
