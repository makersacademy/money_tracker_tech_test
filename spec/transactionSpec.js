'use strict';

describe('Transaction', function () {
  var transaction;

  beforeEach(function () {
    transaction = new Transaction(1000, 'deposit', 1000, '10-01-2012');
  });

  describe('format for statement', function () {
    it('formats a deposit', function () {
      expect(transaction.formatForStatement()).toEqual('10/01/2012 || 1000.00 || || 1000.00');
    });

    it('formats a withdrawal', function () {
      var withdrawal = new Transaction(500, 'withdrawal', 2500, '14-01-2012');
      expect(withdrawal.formatForStatement()).toEqual('14/01/2012 || || 500.00 || 2500.00');
    });
  });
});
