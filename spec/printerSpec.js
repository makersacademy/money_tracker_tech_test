'use strict';

var Printer = require('../src/printer').Printer
var convertStringToDate = require('../src/transaction').convertStringToDate

describe('Printer', function () {
  var printer, listOfTransactionsMock, listOfTransactionsMockSorted;
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

    printer = new Printer(listOfTransactionsMock);
    spyOn(printer, 'printHeader')
    spyOn(printer, 'printOneLine')
  });

  describe('is initialized', function () {
    it('with a list of transactions', function () {
      expect(printer.listOfTransactions).toBe(listOfTransactionsMock)
    });
  });

  describe('#printListOfTransactions', function () {
    it('prints a header', function () {
      printer.printListOfTransactions();
      expect(printer.printHeader).toHaveBeenCalled();
    });
    it('prints a line for each transaction', function () {
      printer.printListOfTransactions();
      expect(printer.printOneLine).toHaveBeenCalled();
    });
  });
});
