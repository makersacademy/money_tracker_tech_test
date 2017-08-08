'use strict';

var Transaction = require('../src/transaction').Transaction

function Account () {
  this.transactions = [],
  this.currentBalance = 0
}

Account.prototype.recordTransaction = function (date, amount) {
  this.currentBalance += amount;
  var transaction = new Transaction(date, amount, this.currentBalance);
  this.transactions.push(transaction)
};

exports.Account = Account;
