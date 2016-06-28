angular.module('bankApp')
  .controller('StatementController', function(StatementService) {
    var self = this;
    self.statement = StatementService.statement;
  });