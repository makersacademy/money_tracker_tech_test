'use strict';

function Transaction (amount, date) {
  this.date = date,
  this.credit = undefined,
  this.debit = undefined,
  this.checkIfCreditOrDebit(amount)
}

Transaction.prototype.checkIfCreditOrDebit = function (amount) {
  return amount > 0 ? this.credit = amount : this.debit = -amount
};
exports.Transaction = Transaction;
