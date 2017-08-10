function Moneytracker() {
  this._transactions = [];
  this._totalBalance = 0;
};

Moneytracker.prototype.recordEarning = function (money, date) {
  this._transactions.push(new Transaction(money, date))
};

Moneytracker.prototype.recordExpenditure = function (money, date) {
  this._transactions.push(new Transaction(money, date))
};

Moneytracker.prototype._updateTotalBalance = function () {
  for(var i = 0; i < this._transactions.length; i++) {
    this._totalBalance += this._transactions[i].credit + this._transactions[i].debit;
    this._transactions[i].balance = this._totalBalance;
  };
};

Moneytracker.prototype.printStatement = function () {
  this._updateTotalBalance();
  var statement = new Statement(this._transactions);
  return statement.createStatement;
};
