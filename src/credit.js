'use strict';

function Credit (account) {
  this.account = account
};

Credit.prototype.makeTransaction = function (date, amount) {
  this.account.recordTransaction(date, amount);
};

exports.Credit = Credit;
