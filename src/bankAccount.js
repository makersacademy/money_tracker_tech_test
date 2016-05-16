'use strict';

function BankAccount () {
  this._balance = 0;
};

BankAccount.prototype.getBalance = function () {
  return this._balance;
};

BankAccount.prototype.deposit = function (amount) {
  this._balance += amount;
};

BankAccount.prototype.withdraw = function (amount) {
  this._balance -= amount;
};
