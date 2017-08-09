'use strict';

var formatDebitTransaction = require('../src/formatter').formatDebitTransaction
var formatCreditTransaction = require('../src/formatter').formatCreditTransaction
var sortedTransactionsByDateAscending = require('../src/formatter').sortedTransactionsByDateAscending;
var addBalanceToEachTransaction = require('../src/formatter').addBalanceToEachTransaction;
var revertDateToString = require('../src/formatter').revertDateToString;
var convertStringToDate = require('../src/transaction').convertStringToDate

describe('formatter functions', function () {
  var listOfTransactionsMock, listOfTransactionsMockSorted, date;
  beforeEach(function () {
    listOfTransactionsMock = [
      {
        date: convertStringToDate('13/01/2012'),
        amount: 2000 },
      {
        date: convertStringToDate('14/01/2012'),
        amount: -500 },
      {
        date: convertStringToDate('10/01/2012'),
        amount: 1000 } ]
  });
  describe('#formatDebitTransaction', function () {
    it('generates a string with debit amount in the thirds column', function () {
      var transaction = {
        date: '10/01/2012',
        amount: -1000,
        balance: 1000}
      expect(formatDebitTransaction(transaction)).toBe(' || || 1000 || 1000')
    });
  });
  describe('#formatCreditTransaction', function () {
    it('generates a string with credit amount in the second column', function () {
      var transaction = {
        date: '10/01/2012',
        amount: 1000,
        balance: 2000 }
      expect(formatCreditTransaction(transaction)).toBe(' || 1000 || || 2000')
    });
  });
  describe('#sortedTransactionsByDateAscending', function () {
    it('sorts a list of dates in ascending order', function () {
      listOfTransactionsMockSorted = sortedTransactionsByDateAscending(listOfTransactionsMock);
      expect(listOfTransactionsMockSorted[0].date.getTime()).toBe(convertStringToDate('10/01/2012').getTime());
      expect(listOfTransactionsMockSorted[1].date.getTime()).toBe(convertStringToDate('13/01/2012').getTime());
      expect(listOfTransactionsMockSorted[2].date.getTime()).toBe(convertStringToDate('14/01/2012').getTime())
    });
  });

  describe('#addBalanceToEachTransaction', function () {
    it('adds the balance at the current transaction', function () {
      listOfTransactionsMockSorted = sortedTransactionsByDateAscending(listOfTransactionsMock);
      addBalanceToEachTransaction(listOfTransactionsMock);
      expect(listOfTransactionsMockSorted[0].balance).toBe(1000);
      expect(listOfTransactionsMockSorted[1].balance).toBe(3000);
      expect(listOfTransactionsMockSorted[2].balance).toBe(2500);
    });
  });
  describe('#revertDateToString', function () {
    it('converts a date into string in dd/mm/yyyy format', function () {
      var date = revertDateToString(convertStringToDate('13/01/2012'));
      expect(date).toBe('13/01/2012');
    });
  })
});
