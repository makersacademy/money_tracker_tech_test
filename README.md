# Money tracker tech test

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
date || earning || spending || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
