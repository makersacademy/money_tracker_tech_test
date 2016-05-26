# The Bank Tech Test

### Assumptions
* The Data is passed to the interface as a part of a system, and not as a user interface
* As such, the input data is expected to be safe and well behaved: transactions are inserted in the right order and they have the correct amounts (no deposit -100 for example).
* For the same reason, the #deposit and #withdraw methods expect a transaction date to be given by the user, and don't default to Date.today

### Structure
* Instances of BankAccount, representing the single account, are injected the TransactionLog class at init, and start with a empty log, a balance of 0 and headers provided by the TransactionLog class.
* #deposit and #withdraw will update the current_balance var in the BankAccount instance, and generate a new instance of TransactionLog, to be stored in the transactions var
* #print_statement will return a human-readable string with the statements in reverse order (immission order, not chronological order)
* Each TransactionLog instance is immutable once instantiated, and is accessed through a custom #to_s method for printing


**************


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
