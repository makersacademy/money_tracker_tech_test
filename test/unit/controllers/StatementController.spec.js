describe('StatementController', function() {
  var statementController;
  var mockStatementService = { statement: 'statement from service' }

  beforeEach(function() {
    module('bankApp', function($provide) {
      $provide.value('StatementService', mockStatementService);
    });
  });

  beforeEach(inject(function($controller) {
    statementController = $controller('StatementController');
  }));

  it('has a record of all transactions', function() {
    expect(statementController.statement).toEqual('statement from service');
  });

});