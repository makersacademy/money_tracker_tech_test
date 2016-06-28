describe('TransactionController', function() {
  var transactionController;
  var mockStatementService = { addTransaction: null };
  var mockState = { go: null };

  beforeEach(function() {
    module('bankApp', function($provide) {
      $provide.value('StatementService', mockStatementService);
      $provide.value('$state', mockState);
    })
  });

  beforeEach(inject(function($controller) {
    spyOn(mockStatementService, 'addTransaction');
    spyOn(mockState, 'go');
    transactionController = $controller('TransactionController');
  }));

  describe('#makeDeposit', function() {
    it('adds a transaction with a credit value', function() {
      transactionController.makeDeposit(10);
      expect(mockStatementService.addTransaction).toHaveBeenCalledWith(10, 0);
    });

    it('redirects to home path', function() {
      transactionController.makeDeposit(10);
      expect(mockState.go).toHaveBeenCalledWith('home');
    })
  });

  describe('#makeWithdrawal', function() {
    it('adds a transaction with a debit value', function() {
      transactionController.makeWithdrawal(10);
      expect(mockStatementService.addTransaction).toHaveBeenCalledWith(0, 10);
    });

    it('redirects to home path', function() {
      transactionController.makeWithdrawal(10);
      expect(mockState.go).toHaveBeenCalledWith('home');
    })
  });

});