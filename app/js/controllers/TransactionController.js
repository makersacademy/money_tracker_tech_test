angular.module('bankApp')
  .controller('TransactionController', function(BalanceService, $state) {
    var self = this;
    self.makeDeposit = makeDeposit;
    self.makeWithdrawal = makeWithdrawal;

    function makeDeposit(amount) {
      BalanceService.updateBalance(parseFloat(amount));
      $state.go('home');
    }

    function makeWithdrawal(amount) {
      BalanceService.updateBalance(-parseFloat(amount));
      $state.go('home');
    }
  });