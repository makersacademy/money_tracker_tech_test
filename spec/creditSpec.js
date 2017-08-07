'use strict';

describe('Credit', function () {
  var credit, accountMock, tranzaction;

  beforeEach(function () {
    accountMock = {
      tranzactions: [],
      currentBalance: 0
    }

    tranzaction = {
      date: new Date(),
      credit: 100,
      debit: 0,
      balance: 100
    }

    credit = new Credit(accountMock);
  });

  describe('is initialized', function () {
    it('with an account', function () {
      expect(credit.account).toBe(accountMock);
    });
  });

  describe('can make a tranzaction', function () {
    it('that is reflected in the current balance', function () {
      credit.makeTranzaction(100);
      expect(accountMock.currentBalance).toBe(100);
    });
  });
});
