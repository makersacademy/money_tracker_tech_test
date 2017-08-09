'use strict';

function Transaction (amount, date) {
  this.date = convertStringToDate(date),
  this.amount = amount
}

function convertStringToDate (string) {
  var dayMontYear = string.split('/');
  return new Date(parseInt(dayMontYear[2]), parseInt(dayMontYear[1] - 1), parseInt(dayMontYear[0]))
}

exports.convertStringToDate = convertStringToDate;
exports.Transaction = Transaction;
