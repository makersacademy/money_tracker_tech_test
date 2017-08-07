'use strict';

var Credit = require('../src/credit').Credit

describe('Credit', function () {
  var credit, accountMock, transaction;

  beforeEach(function () {
    accountMock = {
      transactions: [],
      currentBalance: 0
    }

    credit = new Credit(accountMock);
  });

  describe('is initialized', function () {
    it('with an account', function () {
      expect(credit.account).toBe(accountMock);
    });
  });

  describe('can make a transaction', function () {
    it('that is reflected in the current balance', function () {
      credit.makeTransaction(100);
      expect(accountMock.currentBalance).toBe(100);
    });
  });
});
