'use strict';

function Credit (account) {
  this.account = account
};

Credit.prototype.makeTransaction = function (amount, date) {
  this.account.recordTransaction(amount, date);
};

exports.Credit = Credit;
