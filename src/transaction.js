'use strict';

function Transaction(amount, type, balance, date) {
  this._amount = amount;
  this._type = type;
  this._balance = balance;
  this._date = date || Date.now();
};

Transaction.prototype.formatForStatement = function () {
  var date = this._formatDate();
  var amount = this._formatAmount();
  var balance = this._formatBalance();
  return date + ' || ' + amount + ' || ' + balance;
};

Transaction.prototype._formatDate = function () {
  if (typeof this._date === "number") {
    var date = new Date(this._date);
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var year = date.getFullYear();
    return day + '/' + month + '/' + year;
  } else {
    return this._date.split('-').join('/');
  }
};

Transaction.prototype._formatAmount = function () {
  var amount = this._amount.toFixed(2);
  if (this._isDeposit()) {
    return amount + ' ||';
  }
  if (this._isWithdrawal()) {
    return '|| ' + amount;
  }
};

Transaction.prototype._formatBalance = function () {
  return this._balance.toFixed(2);
};

Transaction.prototype._isDeposit = function () {
  return this._type === 'deposit';
};

Transaction.prototype._isWithdrawal = function () {
  return this._type === 'withdrawal';
};
