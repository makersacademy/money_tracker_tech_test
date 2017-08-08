'use strict';

var Printer = require('../src/printer').Printer

describe('Printer', function () {
  var printer, listOfTransactionsMock;
  beforeEach(function () {
    listOfTransactionsMock = [{
      date: '10/01/2012',
      amount: 1000 },
    {
      date: '13/01/2012',
      amount: 2000 },
    {
      date: '14/01/2012',
      amount: 500 } ]

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
      it('generates a string with credit amount in the second column', function () {
        var transaction = {
          date: '10/01/2012',
          amount: 1000 }
        expect(printer.formatTransactionLine(transaction)).toBe('10/01/2012 || 1000 || || ')
      });
      it('generates a string with debit amount in the thirds column', function () {
        var transaction = {
          date: '10/01/2012',
          amount: -1000 }
        expect(printer.formatTransactionLine(transaction)).toBe('10/01/2012 || || 1000 || ')
      });
    })
  });
});
