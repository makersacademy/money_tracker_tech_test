'use strict';

describe('Account', function () {
  var account;
  beforeEach(function () {
    account = new Account();
  });

  describe('is initialized', function () {
    it('with an empty array of tranzactions', function () {
      expect(account.tranzactions).not.toBe(null);
    });

    it('with a current balance of 0', function () {
      expect(account.currentBalance).toBe(0);
    });
  })
})
