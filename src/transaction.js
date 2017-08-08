'use strict';

function Transaction (amount, currentBalance, date = new Date()) {
  this.date = date,
  this.balance = currentBalance,
  this.credit = undefined,
  this.debit = undefined,
  this.checkIfCreditOrDebit(amount)
}

Transaction.prototype.checkIfCreditOrDebit = function (amount) {
  return amount > 0 ? this.credit = amount : this.debit = -amount
};
exports.Transaction = Transaction;
