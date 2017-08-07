'use strict';

function Account () {
  this.transactions = [],
  this.currentBalance = 0
}

Account.prototype.recordTransaction = function () {
};

exports.Account = Account;
