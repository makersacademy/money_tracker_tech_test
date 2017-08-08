function Moneytracker(date, credit, debit, balance) {
  this.date = "";
  this.credit = 0;
  this.debit = 0;
  this.balance = 0;
};

var transactions = [];

Moneytracker.prototype.deposit = function (money, dateOfTransaction) {
  this.credit += money;
  this.insertDate(dateOfTransaction);
  this.balance += money;
  this._createTransaction();
};

Moneytracker.prototype.withdraw = function (money, dateOfTransaction) {
  this.debit -= money;
  this.insertDate(dateOfTransaction);
  this.balance -= money;
  this._createTransaction();
};

Moneytracker.prototype.insertDate = function (dateOfTransaction) {
  this.date = dateOfTransaction;
};

Moneytracker.prototype._createTransaction = function () {
  var transaction = {
      date: this.date,
      credit: String(this.credit),
      debit: String(this.debit),
      balance: String(this.balance)
    };
    transactions.push(transaction)
    this._resetTransaction();
  };

Moneytracker.prototype.statement = function () {
  console.table(transactions);
};

Moneytracker.prototype._resetTransaction = function () {
  this.date = "";
  this.credit = 0;
  this.debit = 0;
};
