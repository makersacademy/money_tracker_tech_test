# Money tracker tech test

## User Stories

```
As a user.
So that I can monitor my cash flow.
I would like to be able to track the money I spend and earn.

As a user.
So that I can monitor the money I've spent.
I would like to be able to record the amount and the date I spent it on.

As a user.
So that I can monitor the money I've earned.
I would like to be able to record the amount and the date I earned it on.

As a user.
So that I can see all the records in one place.
I would like to be able to print an account statement that shows all the records (date, amount, balance).
```

## Specification

### Acceptance criteria

**Given** you record that you earned 1000 on 10-01-2012
**And** earned 2000 on 13-01-2012
**And** spent 500 on 14-01-2012
**When** you print your bank statement
**Then** you would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
