'use strict';

function Printer (listOfTransactions) {
  this.listOfTransactions = listOfTransactions
}

Printer.prototype.formatTransactionLine = function (transaction) {
  if (!transaction.credit) { transaction.credit = '' }
  if (!transaction.debit) { transaction.debit = '' }
};

Printer.prototype.printOneLine = function (transaction) {
  this.formatTransactionLine(transaction);
  console.log(transaction.date + ' || ' + transaction.credit + ' || ' + transaction.debit);
};

Printer.prototype.printHeader = function () {
  console.log('date || credit || debit || balance')
};

Printer.prototype.printListOfTransactions = function () {
  this.printHeader();
  var self = this;
  this.listOfTransactions.reverse().forEach(function (transaction) {
    self.printOneLine(transaction);
  })
};

exports.Printer = Printer;
