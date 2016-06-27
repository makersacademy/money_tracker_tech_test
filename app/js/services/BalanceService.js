angular.module('bankApp')
  .service('BalanceService', function() {
    var self = this;
    self.currentBalance = 0;
    self.updateBalance = updateBalance;

    function updateBalance(amount) {
      self.currentBalance += amount;
    }
  });