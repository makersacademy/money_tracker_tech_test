'use strict';

var Transaction = require('../src/transaction').Transaction

describe('Transaction', function () {
  var transaction, date, amount;

  beforeEach(function () {
    date = new Date(2017, 7, 7);
    amount = 100;
    transaction = new Transaction(amount, date);
  });

  describe('is initialized', function () {
    it('with a date', function () {
      expect(transaction.date).toBe(date);
    });
    it('with an amount', function () {
      expect(transaction.amount).toBe(amount)
    });
  });
})
