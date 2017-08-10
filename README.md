# Money tracker tech test

## The Specification

* Write a program that could be used to track money you spend and earn.

* Interact with the program via the command line.

* Be able to record money spent and the date it was spent on.  

* Be able to record money earned and the date it as earned on.  

* Be able to print a list of all the records (date, amount, balance).

* Data can be kept in memory.

## My Approach

I started by diagramming the problem and separating out the main responsibilities into classes.  My original structure and naming of the classes was closer to a bank account than a money tracker app and so I refactored mid-way through.  I ended up with three classes: statement, recordlist and entry which I think all have defined responsibilities and whose code neatly links them all together while showing due consideration to the Law of Demeter.  My main struggle was converting the code's existing running balance, which tied all the classes together, to a balance calculated at the point of printing the statement - for me this was the most ineteresting part of the process.

## Technologies used

Ruby, Rspec, Coverall, Rubocop

## How to run the programme

* Clone this repo
* Create a new recordlist and make an entry including the amount and the date earned/spent:

![Screenshot](http://imgur.com/WHdjBXG.jpg)

* Print a statement:

![Screenshot](http://imgur.com/pX2OGmH.jpg)

* You see:

![Screenshot](http://imgur.com/pWaLYCl.jpg)

## Test Coverage

My goal was to have high test coverage and so I installed Coverall to help me analyse this aspect of my code. I finished with 100% coverage according to Coverall :)

![Screenshot](http://imgur.com/ip7obaO.jpg)

