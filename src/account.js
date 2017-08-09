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
  if (!isDateValid(date)) throw 'Please enter a date in dd/mm/yyyy format';
  this.recordTransaction(amount, date);
};

Account.prototype.withdrewMoney = function (amount, date) {
  if (!isDateValid(date)) throw 'Please enter a date in dd/mm/yyyy format';
  this.recordTransaction(-amount, date);
};

function isDateValid (string) {
  var splitDate = parseStringToDate(string);
  if (string === null || splitDate === null) { return false }
  var day = +splitDate[1], month = +splitDate[2], year = +splitDate[3];

  if (!isDayValid || !isMonthValid) {
    return false
  } else {
    return true
  }
};

function isDayValid (day) {
  return day >= 1 && day <= 31
}

function isMonthValid (month) {
  return month >= 1 && month <= 12
}

function parseStringToDate (string) {
  return string.match(/^(\d{2})\/(\d{2})\/(\d{4})$/);
}

exports.Account = Account;
