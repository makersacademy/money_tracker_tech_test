'use strict';

var Transaction = require('../src/transaction').Transaction
var convertStringToDate = require('../src/transaction').convertStringToDate

describe('Transaction', function () {
  var transaction, date, amount, dateConverted;

  beforeEach(function () {
    date = '10/01/2012'
    dateConverted = convertStringToDate(date)
    amount = 100;
    transaction = new Transaction(amount, date);
  });

  describe('is initialized', function () {
    it('with a date', function () {
      expect(transaction.date.getTime()).toBe(dateConverted.getTime());
    });
    it('with an amount', function () {
      expect(transaction.amount).toBe(amount)
    });
  });
  describe('#convertStringToDate', function () {
    it('converts a string to a Date object', function () {
      var newDate = convertStringToDate('10/01/2012');
      expect(newDate.getFullYear()).toBe(2012);
      expect(newDate.getMonth()).toBe(0);
      expect(newDate.getDate()).toBe(10);
    });
  });
})
