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
