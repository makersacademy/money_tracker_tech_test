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

// Moneytracker.prototype.printStatement = function () {
//   this._updateTotalBalance();
//   return this._createStatementHeader() + this._createStatement();
// };

Moneytracker.prototype.printStatement = function () {
  this._updateTotalBalance();
  var statement = new Statement(this._transactions);
  return statement.create;
};

// Moneytracker.prototype._createStatement = function () {
//   var statement = "";
//   for(var i = 0; i < this._transactions.length; i++) {
//     statement += (this._transactions[i].date) + " || " +
//                  (this._transactions[i].credit) + " || " +
//                  (this._transactions[i].debit) + " || " +
//                  (this._transactions[i].balance) + "\n";
//   };
//   return statement;
// };

// Moneytracker.prototype._createStatementHeader = function () {
//   return "date || credit || debit || balance\n";
// };
