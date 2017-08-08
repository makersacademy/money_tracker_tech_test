'use strict';

var Transaction = require('../src/transaction').Transaction

function Account () {
  this.transactions = []
}

Account.prototype.recordTransaction = function (amount, date) {
  var transaction = new Transaction(amount, date);
  this.transactions.push(transaction)
};

Account.prototype.madeDeposit = function (amount, date) {
  this.recordTransaction(amount, date);
};

Account.prototype.withdrewMoney = function (amount, date) {
  this.recordTransaction(-amount, date);
};

exports.Account = Account;
