# The Bank Tech Test

Hi!
Thanks for reviewing my code,
I choose to solve this Kata using Ruby and RSpec for testing.
I managed to implement the MVP functionality (see: Acceptance criteria) within time.
I wanted to implement the additional goals and a UI but I ran out of time and couldn't get ***SHOES*** or ***GTK2*** to work in my current Linux distro, so, I left the app as a CLI with some colours added using the ***Rainbow gem***.

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
