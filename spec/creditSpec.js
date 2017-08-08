'use strict';

var Credit = require('../src/credit').Credit

describe('Credit', function () {
  var credit, accountMock, transaction;

  beforeEach(function () {
    accountMock = {
      transactions: [],
      currentBalance: 0,
      recordTransaction: function () {}
    };
    credit = new Credit(accountMock);
    spyOn(accountMock, 'recordTransaction')
  });

  describe('is initialized', function () {
    it('with an account', function () {
      expect(credit.account).toBe(accountMock);
    });
  });

  describe('can make a transaction', function () {
    it('that is recorded in the account', function () {
      credit.makeTransaction(100);
      expect(accountMock.recordTransaction).toHaveBeenCalled();
    });
  });
});
