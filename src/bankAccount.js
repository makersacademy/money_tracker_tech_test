'use strict';

function BankAccount (Transaction) {
  this._balance = 0;
  this._transactions = [];
  this._Transaction = Transaction;
};

BankAccount.prototype.getBalance = function () {
  return this._balance;
};

BankAccount.prototype.getTransactions = function () {
  return this._transactions;
};

BankAccount.prototype.deposit = function (amount, date) {
  this._balance += amount;
  var transaction = new this._Transaction(amount, 'deposit', this._balance, date);
  this._recordTransaction(transaction);
};

BankAccount.prototype.withdraw = function (amount, date) {
  this._balance -= amount;
  var transaction = new this._Transaction(amount, 'withdrawal', this._balance, date);
  this._recordTransaction(transaction);
};

BankAccount.prototype._recordTransaction = function (transaction) {
  this._transactions.push(transaction);
};

BankAccount.prototype.printStatement = function () {

};
