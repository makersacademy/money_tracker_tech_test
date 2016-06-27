angular.module('bankApp')
  .controller('HomeController', function(BalanceService) {
    var self = this;
    self.currentBalance = BalanceService.currentBalance;
  });