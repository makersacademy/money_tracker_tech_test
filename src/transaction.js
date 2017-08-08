'use strict';

function Transaction (amount, date) {
  this.date = date,
  this.amount = amount
}

exports.Transaction = Transaction;
