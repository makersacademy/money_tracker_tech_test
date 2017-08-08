'use strict';

var Debit = require('../src/debit').Debit

describe('Debit', function () {
  var debit, accountMock, date;
  beforeEach(function () {
    accountMock = {
      transactions: [],
      currentBalance: 0,
      recordTransaction: function () {}
    };
    debit = new Debit(accountMock);
    spyOn(accountMock, 'recordTransaction')
  });

  describe('is initialized', function () {
    it('with an account', function () {
      expect(debit.account).toBe(accountMock);
    });
  });
  describe('can make a transaction', function () {
    it('that is recorded in the account', function () {
      debit.makeTransaction(100, date);
      expect(accountMock.recordTransaction).toHaveBeenCalled();
    });
  });
});
