'use strict';

function Debit (account) {
  this.account = account
};

Debit.prototype.makeTransaction = function (amount, date) {
  this.account.recordTransaction(-amount, date);
};

exports.Debit = Debit;
