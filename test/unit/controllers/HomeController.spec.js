describe('HomeController', function() {
  var homeController;
  var mockBalanceService = { currentBalance: 'current balance from service' };

  beforeEach(function() {
    module('bankApp', function($provide) {
      $provide.value('BalanceService', mockBalanceService);
    })
  });

  beforeEach(inject(function($controller) {
    homeController = $controller('HomeController');
  }));

  it('gets the current balance', function() {
    expect(homeController.currentBalance).toEqual('current balance from service');
  });

});