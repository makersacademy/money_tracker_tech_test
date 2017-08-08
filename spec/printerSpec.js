'use strict';

var Printer = require('../src/printer').Printer

describe('Printer', function () {
  var printer, listOfTransactionsMock;
  beforeEach(function () {
    listOfTransactionsMock = [{
      date: '10/01/2012',
      credit: 1000,
      debit: undefined,
      balance: 1000 },
    {
      date: '13/01/2012',
      credit: 2000,
      debit: undefined,
      balance: 3000 },
    {
      date: '14/01/2012',
      credit: undefined,
      debit: 500,
      balance: 2500 } ]

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
    describe('#formatTransactionLine', function () {
      it('replaces undefined with space', function () {
        var transaction = {
          date: '10/01/2012',
          credit: 1000,
          debit: undefined,
          balance: 1000 }
        printer.formatTransactionLine(transaction);
        expect(transaction.debit).toBe('')
      });
    })
  });
});
