'use strict';

describe('Account', function () {
  var account;
  beforeEach(function () {
    account = new Account();
  });

  describe('is initialized', function () {
    it('with an empty array of tranzactions', function () {
      expect(account.tranzactions).not.toBe(null);
    })
  })
})
