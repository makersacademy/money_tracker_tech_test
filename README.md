# Money tracker tech test

A program you can use to track money you spend and earn.


Instructions
------------
```
$ git clone https://github.com/makersacademy/money_tracker_tech_test.git
$ open SpecRunner.html
```
Use the console in the browser to start adding your earnings and expenditures or print out a statement!

Features
--------
* Add earnings (with a date)

* Add expenditures (with a date)

* Print a statement of the transactions (earnings and expenditures) with a running balance

Commands
--------
To make a new money tracker, use:

  ```JavaScript
  var moneytracker = new Moneytracker();
  ```
To make a recording of an earning, use:

  ```JavaScript
  moneytracker.recordEarning(money, date);
  ```
* replace money with the amount earned
* replace date with a date in the format of **"dd/mm/yy"**

To make a recording of an expenditure, use:
  ```JavaScript
  moneytracker.recordExpenditure(money, date);
  ```
* replace money with the amount spent
* replace date with a date in the format of **"dd/mm/yy"**

To print a statement of the current transactions, use:

  ```JavaScript
  console.log(moneytracker.printStatement());
  ```
