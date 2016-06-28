angular.module('bankApp')
  .service('StatementService', function(TransactionFactory) {
    var self = this;
    self.statement = [];
    self.addTransaction = addTransaction;

    function addTransaction(credit, debit) {
      self.statement.push(new TransactionFactory(credit, debit));
    }

  });