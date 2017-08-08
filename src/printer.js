'use strict';

function Printer (listOfTransactions) {
  this.listOfTransactions = listOfTransactions
}

Printer.prototype.formatTransactionLine = function (transaction) {
  if (transaction.amount < 0) {
    return transaction.date + ' || || ' + (-transaction.amount) + ' || '
  } else {
    return transaction.date + ' || ' + transaction.amount + ' || || '
  }
};

Printer.prototype.printOneLine = function (transaction) {
  console.log(this.formatTransactionLine(transaction));
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
