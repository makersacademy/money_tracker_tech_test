'use strict';

(function (exports) {
  function Credit (account) {
    this.account = account
  };

  Credit.prototype.makeTranzaction = function (amount) {
    this.account.currentBalance += amount
  };

  exports.Credit = Credit;
})(this);
