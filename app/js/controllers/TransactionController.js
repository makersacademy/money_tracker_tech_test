angular.module('bankApp')
  .controller('TransactionController', function(StatementService, $state) {
    var self = this;
    self.makeDeposit = makeDeposit;
    self.makeWithdrawal = makeWithdrawal;

    function makeDeposit(amount) {
      StatementService.addTransaction(parseFloat(amount), 0);
      $state.go('home');
    }

    function makeWithdrawal(amount) {
      StatementService.addTransaction(0, parseFloat(amount));
      $state.go('home');
    }
  });