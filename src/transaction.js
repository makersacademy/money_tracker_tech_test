'use strict';

function Transaction (date = new Date(), amount, currentBalance) {
  this.date = date,
  this.credit = amount,
  this.balance = currentBalance
}

exports.Transaction = Transaction;
