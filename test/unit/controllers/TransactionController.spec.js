describe('TransactionController', function() {
  var transactionController;
  var mockBalanceService = { updateBalance: null };
  var mockState = { go: null };

  beforeEach(function() {
    module('bankApp', function($provide) {
      $provide.value('BalanceService', mockBalanceService);
      $provide.value('$state', mockState);
    })
  });

  beforeEach(inject(function($controller) {
    spyOn(mockBalanceService, 'updateBalance');
    spyOn(mockState, 'go');
    transactionController = $controller('TransactionController');
  }));

  describe('#makeDeposit', function() {
    it('increases the balance by the specified amount', function() {
      transactionController.makeDeposit(10);
      expect(mockBalanceService.updateBalance).toHaveBeenCalledWith(10);
    });

    it('redirects to home path', function() {
      transactionController.makeDeposit(10);
      expect(mockState.go).toHaveBeenCalledWith('home');
    })
  });

  describe('#makeWithdrawal', function() {
    it('decreases the balance by the specified amount', function() {
      transactionController.makeWithdrawal(10);
      expect(mockBalanceService.updateBalance).toHaveBeenCalledWith(-10);
    });

    it('redirects to home path', function() {
      transactionController.makeWithdrawal(10);
      expect(mockState.go).toHaveBeenCalledWith('home');
    })
  });

});