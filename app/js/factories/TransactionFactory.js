angular.module('bankApp')
  .factory('TransactionFactory', function() {
    var Transaction = function(credit, debit) {
      this.credit = credit;
      this.debit = debit;
      this.date = new Date();
    }

    return Transaction;
  });