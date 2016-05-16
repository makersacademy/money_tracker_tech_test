'use strict';

function Transaction(amount, type, balance, date) {
  this._amount = amount;
  this._type = type;
  this._balance = balance;
  this._date = date || new Date();
};

Transaction.prototype.getDate = function () {
  return this._date;
};

Transaction.prototype.getAmount = function () {
  return this._amount;
};

Transaction.prototype.getBalance = function () {
  return this._balance;
};

Transaction.prototype.isDeposit = function () {
  return this._type === 'deposit';
};
