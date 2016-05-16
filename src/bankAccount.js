'use strict';

function BankAccount (Transaction) {
  this._balance = 0;
  this._transactionHistory = [];
  this._Transaction = Transaction;
  this._statementHeader = 'date || credit || debit || balance';
};

BankAccount.prototype.getBalance = function () {
  return this._balance;
};

BankAccount.prototype.getTransactionHistory = function () {
  return this._transactionHistory;
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

BankAccount.prototype.printStatement = function () {
  var statementBody = '';
  this.getTransactionHistory().forEach(function (transaction) {
    statementBody = statementBody + transaction.formatForStatement() + '\n';
  });
  return this._statementHeader + '\n' + statementBody;
};

BankAccount.prototype._recordTransaction = function (transaction) {
  this._transactionHistory.push(transaction);
};
