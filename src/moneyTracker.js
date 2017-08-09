function Moneytracker() {
  this._transactions = [];
};

Moneytracker.prototype.recordEarning = function (money, date) {
  this._transactions.push(new Transaction(money, date))
};

Moneytracker.prototype.recordExpenditure = function (money, date) {
  this._transactions.push(new Transaction(money, date))
};

Moneytracker.prototype._balance = function () {
  var totalBalance = 0;
  for(i = 0; i < this._transactions.length; i++) {
    totalBalance += this._transactions[i].credit + this._transactions[i].debit;
    this._transactions[i]._balance = totalBalance;
  };
  return totalBalance;
};

Moneytracker.prototype.printBalance = function () {
  console.log("Balance: " + String(this._balance()));
};

Moneytracker.prototype.printStatement = function () {
  this._balance();
  console.log("date || credit || debit || balance\n");
  for(i = 0; i < this._transactions.length; i++) {
    console.log(String((this._transactions[i].date) + " || " +
                       (this._transactions[i].credit) + " || " +
                       (this._transactions[i].debit) + " || " +
                       (this._transactions[i]._balance)));
  };
};
