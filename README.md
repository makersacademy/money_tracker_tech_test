A simple command line program to fulfill the requirements for the below Tech Test for a Bank.

My Aims:

  Object Orientated.
  Encapsulation - given the accessibility of accounts
  Modular and following the open/closed principal.
  Simple and fulfilling just the requirements outlined below. YAGNI (You Ain't Gonna Need It).

Test Driven:

  Feature tests written first, with unit tests written until feature test passes.

SOLID and Sandi Metz Principals:

  No classes over 100 lines.
  No methods over 5 lines.
  Only instantiate one object in the controller or User Interface class (here named 'Client').
  No more than 4 parameters passed into a method.

Readability:

  Willing to violate Hound line-length rules to ensure that methods have descriptive names - if need be.
  Aims for anybody to be able to read and contribute to the code without any need for explanation.

# The Challenge:

# The Bank Tech Test

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
