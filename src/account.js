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

exports.Account = Account;
