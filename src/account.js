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
  validateDate(date);
  this.recordTransaction(amount, date);
};

Account.prototype.withdrewMoney = function (amount, date) {
  validateDate(date);
  this.recordTransaction(-amount, date);
};

function validateDate (string) {
  if (string === null) { throw 'Please enter a date in dd/mm/yyyy format' }
  var splitDate = string.match(/^(\d{2})\/(\d{2})\/(\d{4})$/);
  if (splitDate === null) { throw 'Please enter a date in dd/mm/yyyy format' }

  var day = +splitDate[1], month = +splitDate[2], year = +splitDate[3];

  if (!(month >= 1 && month <= 12 && day >= 1 && day <= 31)) {
    throw 'Please enter a date in dd/mm/yyyy format'
  }
};

exports.validateDate = validateDate;
exports.Account = Account;
