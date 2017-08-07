function Moneytracker(date = new Date, credit, debit, balance) {
  this.date = null;
  this.credit = 0;
  this.debit = 0;
  this.balance = 0;
};

var transactions = [];

Moneytracker.prototype.deposit = function (money) {
  this.credit += money;
  this.balance += money;
  this._createTransaction();
};

Moneytracker.prototype.withdraw = function (money) {
  this.debit -= money;
  this.balance -= money;
  this._createTransaction();
};

Moneytracker.prototype._createTransaction = function () {
  var transaction = {
      date: new Date().toLocaleDateString(),
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
  this.date = [];
  this.credit = 0;
  this.debit = 0;
};
