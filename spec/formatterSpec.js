'use strict';

var Formatter = require('../src/formatter').Formatter;
var convertStringToDate = require('../src/transaction').convertStringToDate

describe('Formatter', function () {
  var formatter, listOfTransactionsMock, listOfTransactionsMockSorted, date;

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
        amount: 1000 } ];
    formatter = new Formatter();
  });

  describe('#sortedListByDateAscending', function () {
    it('sorts a list of dates in ascending order', function () {
      listOfTransactionsMockSorted = formatter.sortedListByDateAscending(listOfTransactionsMock);
      expect(listOfTransactionsMockSorted[0].date.getTime()).toBe(convertStringToDate('10/01/2012').getTime());
      expect(listOfTransactionsMockSorted[1].date.getTime()).toBe(convertStringToDate('13/01/2012').getTime());
      expect(listOfTransactionsMockSorted[2].date.getTime()).toBe(convertStringToDate('14/01/2012').getTime())
    });
  });

  describe('#addBalanceToEachTransaction', function () {
    it('adds the balance at the current transaction', function () {
      listOfTransactionsMockSorted = formatter.sortedListByDateAscending(listOfTransactionsMock);
      formatter.addBalanceToEachTransaction(listOfTransactionsMock);
      expect(listOfTransactionsMockSorted[0].balance).toBe(1000);
      expect(listOfTransactionsMockSorted[1].balance).toBe(3000);
      expect(listOfTransactionsMockSorted[2].balance).toBe(2500);
    });
  });

  describe('#revertDateToString', function () {
    it('converts a date into string in dd/mm/yyyy format', function () {
      var date = formatter.revertDateToString(convertStringToDate('13/01/2012'));
      expect(date).toBe('13/01/2012');
    });
  })
});
