# The Bank Tech Test
[![Build Status](https://travis-ci.org/AyahuascaCeremony/bank_tech_test.svg?branch=master)](https://travis-ci.org/AyahuascaCeremony/bank_tech_test)

### My approach
I take an Outside-In approach to TDD, trying to write tests that describe the User scenario clearly.
This helps me to clarify the requirement to myself, begins to define the public API of my system, and should serve as documentation for the software.
As a result you also get good test coverage which isn't so tightly coupled to the implementation that the tests are brittle.

1. My starting point is to figure out how to test the printing of bank statements.
   The simplest way to do that is to create a new account and immediately print the bank statement.
   
2. Next I wanted to drive out the Deposit API. First test can be satisfied by hard-coded implementation, so a second test is used to drive some print logic.

*NOTE*
I try to find the simplest piece of functionality to implement, and/or one that will bring me the most value at that point.
So, having done single deposits I now have a choice of multiple deposits, or to switch to single withdrawals.
It's easy to get carried away so by rigorously trying to simplify I, hopefully, ensure that I drive the implementation gradually without creating problems for myself.

3. I realised I've used an array for deposits and a loop for printing them, so I decide to finish testing multiple deposits.

4. Wow. 2nd evening on this and I realised I'd jumped further than I should have. I missed the ordering of the transactions, but trusted myself to be able to resolve it so continued with coding and using my tests to check frequently that I was progressing.

5. The resulting code has some ugly bits which I'm not proud of - breaks OCP, and SRP is not followed well. But it works which is Kent Beck's first rule of simple design. And it's quite readable so the intent is clear.

6. The software could ship in this current state. But I feel there's potential for a more elegant solution.




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
