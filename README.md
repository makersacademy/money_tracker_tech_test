# The Bank Tech Test

A simple CLI program emulating a current account.

## Usage

Run the program from the root project directory by running it in pry or irb:
```sh
# pry
$ pry
> require "./lib/account.rb"

# irb
$ irb
> require "./lib/account.rb"
```

You can then execute the following commands:
* Create a new account object
```sh
> account = Account.new
```
* Deposit and withdraw money
```sh
> account.deposit(1000)
> account.withdraw(700)
```
* Print account statement
```sh
> account.print_statement
#       date ||     credit ||      debit ||    balance
# 04/04/2016 ||    1000.00 ||            ||    1000.00
# 04/04/2016 ||            ||     700.00 ||     300.00
```

## Future improvements
* Sort print statement in reverse chronological order
* Extract transaction class
* Test dates using Timecop
* Modularize formatting algorithm
* Implement statement filters
* Implement a CLI or web GUI
