[![Build Status](https://travis-ci.org/barrygrubb/bank_tech_test.svg?branch=master)](https://travis-ci.org/barrygrubb/bank_tech_test)

# The Bank Tech Test

### Requirements
The requirements for this tech test can be found [here](README_original.md) and [here](CONTRIBUTING.md).

### Solving the challenge

* Following Agile Methodologies I began by writing user stories for each of the project's basic requirements. The list of user stories can be found [here](user_stories.md). As I complete each user story I will list it under the section entitled "Completed User Stories".

* Based upon the given instruction: "When in doubt, go for the simplest solution", I opted to begin by building my solution as a command line program in Ruby. The program will be developed test-first, and the tests will be written using Rspec.

* I began by implementing the ability for a bank account to be created, and initialized with a starting balance of 0.

* Seeing as the requirements specify that completing the challenge is not mandatory, however implementing Travis CI *is*, I opted to next begin work on implementing Travis CI with my repository. There was a good chance that implementing Travis CI could introduce some unforeseen complications, so I opted not to leave it until any later in the challenge.

* My next step was to submit a pull request to the Makers Academy repo, so that I could solicit feedback from Hound CI as early as possible.

* I next implemented the ability to create a deposit and have it update the bank account balance accordingly.

* I next implemented the ability to create a withdrawal and have it update the bank account balance accordingly.

* I next added the ability to show a statement via the account's #show_statement method, which initially outputs the string "balance", along with the actual account balance to stdout.

* I next implemented the displaying of deposit and withdrawal information when showing a statement. I originally wrote these as two separate user stories, but it transpired that they were very similar, and so were easily implemented together without complication.

###Instructions

* First clone the repo locally using `git clone https://github.com/barrygrubb/bank_tech_test.git`.

* `cd` in to the project directory.

* Run `bundle` in order to install an required dependencies.

* Run `irb` to open the interactive Ruby environment.

* Require all necessary Ruby files using the following:
```
require './lib/bank_account'
require './lib/deposit'
require './lib/withdrawal'
```

* Create a bank account and pass it a name as a string, as follows:
```
account = BankAccount.new("Account Name")
```

* Create a new deposit and pass it the bank, the amount to deposit and the date as a string, as follows:
```
deposit_1 = Deposit.new(account, 100, "01/01/2016")
```

* Finalize the deposit, as follows:
```
deposit_1.finalize
```

* Check the current bank account statement using the following:
```
account.show_statement
```

* Create a new withdrawal and pass it the bank, the amount to withdraw and the date as a string, as follows:
```
withdrawal_1 = Withdrawal.new(account, 50, "02/02/2016")
```

* Finalize the withdrawal, as follows:
```
withdrawal_1.finalize
```

* Check the current bank account statement using the following:
```
account.show_statement
```

###Completed User Stories

```
As a user,
So that I can store my funds,
I would like a bank account.
```

```
As a user,
So that I can add funds to my bank account,
I would like to be able to make a deposit.
```

```
As a user,
So that I can remove funds from my bank account,
I would like to be able to make a withdrawal.
```

```
As a user,
So that I can view my current bank account balance,
I would like to be able to view a statement which includes the current balance.
```

```
As a user,
So that I can view my deposit history,
I would like for the statement to include all deposits which I have made.
```

```
As a user,
So that I can view my withdrawal history,
I would like for the statement to include all withdrawals which I have made.
```

###Where I Would Progress From here

For my interpretation of the requirement: "* Statement printing" I intended to implement a #print_statement method on the BankAccount class, which would function similarly to the #show_statement method, but would output to a file rather than stdout. However I ran out of time to do so during the tech test, and more research is required for me to be able to write an effective test for the ability for a method to write to a file.
