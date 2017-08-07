function Moneytracker(date = new Date, credit, debit, balance) {
  this.date = null;
  this.credit = 0;
  this.debit = 0;
  this.balance = 0;
};

// var d = new Date();
// var newDate = d.toLocaleDateString();

var transactions = [];

Moneytracker.prototype.deposit = function (money) {
  // this.dateOfTransaction(newDate);
  this.credit += money;
  this.balance += money;
  this.createTransaction();
};

Moneytracker.prototype.withdraw = function (money) {
  // this.dateOfTransaction(newDate);
  this.debit -= money;
  this.balance -= money;
  this.createTransaction();
};

Moneytracker.prototype.createTransaction = function () {
  var transaction = {
      date: new Date().toLocaleDateString(),
      credit: String(this.credit),
      debit: String(this.debit),
      balance: String(this.balance)
    };
    transactions.push(transaction)
    this.resetTransaction();
  };

Moneytracker.prototype.statement = function () {
  console.table(transactions);
};

Moneytracker.prototype.resetTransaction = function () {
  this.date = [];
  this.credit = 0;
  this.debit = 0;
};
//
// Moneytracker.prototype.dateOfTransaction = function(newDate) {
//   this.date.push(newDate);
// };
