describe('BalanceService', function() {

  var balanceService;

  beforeEach(module('bankApp'));

  beforeEach(inject(function(BalanceService) {
    balanceService = BalanceService;;
  }));

  it('is initialized with a balance of zero', function() {
    expect(balanceService.currentBalance).toEqual(0);
  });

  describe('#updateBalance', function() {
    it('updates the current balance by the given amount', function() {
      balanceService.updateBalance(10);
      expect(balanceService.currentBalance).toEqual(10);
    });
  });
});