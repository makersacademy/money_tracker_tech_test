'use strict';

function Transaction (amount, currentBalance, date) {
  this.date = date,
  this.credit = undefined,
  this.debit = undefined,
  this.balance = currentBalance,
  this.checkIfCreditOrDebit(amount)
}

Transaction.prototype.checkIfCreditOrDebit = function (amount) {
  return amount > 0 ? this.credit = amount : this.debit = -amount
};
exports.Transaction = Transaction;
