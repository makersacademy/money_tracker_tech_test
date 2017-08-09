
'use strict';

var formatDebitTransaction = require('../src/formatter').formatDebitTransaction
var formatCreditTransaction = require('../src/formatter').formatCreditTransaction
var addBalanceToEachTransaction = require('../src/formatter').addBalanceToEachTransaction;
var revertDateToString = require('../src/formatter').revertDateToString;

function Printer (listOfTransactions) {
  this.listOfTransactions = listOfTransactions
}

Printer.prototype.printOneLine = function (transaction) {
  process.stdout.write(revertDateToString(transaction.date));
  if (transaction.amount > 0) {
    console.log(formatCreditTransaction(transaction));
  } else {
    console.log(formatDebitTransaction(transaction));
  }
};

Printer.prototype.printHeader = function () {
  console.log('date || credit || debit || balance')
};

Printer.prototype.printListOfTransactions = function () {
  addBalanceToEachTransaction(this.listOfTransactions);
  this.printHeader();
  var self = this;
  this.listOfTransactions.reverse().forEach(function (transaction) {
    self.printOneLine(transaction);
  })
};

exports.Printer = Printer;
