
'use strict';

var Formatter = require('../src/formatter').Formatter

function Printer (listOfTransactions) {
  this.listOfTransactions = listOfTransactions,
  this.formatter = new Formatter()
}

Printer.prototype.printOneLine = function (transaction) {
  process.stdout.write(this.formatter.revertDateToString(transaction.date));
  if (transaction.amount > 0) {
    console.log(this.formatter.formatCreditTransaction(transaction));
  } else {
    console.log(this.formatter.formatDebitTransaction(transaction));
  }
};

Printer.prototype.printHeader = function () {
  console.log('date || credit || debit || balance')
};

Printer.prototype.printListOfTransactions = function () {
  this.printHeader();
  var self = this;
  this.formatter
    .addBalanceToEachTransaction(this.listOfTransactions)
    .reverse()
    .forEach(function (transaction) {
      self.printOneLine(transaction);
    })
};

exports.Printer = Printer;
