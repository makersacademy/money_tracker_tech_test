'use strict';

function Credit (account) {
  this.account = account
};

Credit.prototype.makeTransaction = function (amount) {
  this.account.currentBalance += amount
  this.account.recordTransaction();
};

exports.Credit = Credit;
