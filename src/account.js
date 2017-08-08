'use strict';

var Transaction = require('../src/transaction').Transaction

function Account () {
  this.transactions = [],
  this.currentBalance = 0
}

Account.prototype.recordTransaction = function (amount, date) {
  this.currentBalance += amount;
  var transaction = new Transaction(amount, this.currentBalance, date);
  this.transactions.push(transaction)
};

Account.prototype.madeDeposit = function (amount, date) {
  this.recordTransaction(amount, date);
};

Account.prototype.withdrewMoney = function (amount, date) {
  this.recordTransaction(-amount, date);
};

exports.Account = Account;
