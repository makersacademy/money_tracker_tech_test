'use strict';

function Printer (listOfTransactions) {
  this.listOfTransactions = listOfTransactions
}

function formatDebitTransaction (debit) {
  return debit.date + ' || || ' + (-debit.amount) + ' || ' + debit.balance
};

function formatCreditTransaction (credit) {
  return credit.date + ' || ' + credit.amount + ' || || ' + credit.balance
};

Printer.prototype.addBalanceToEachTransaction = function () {
  var balance = 0;
  this.listOfTransactions.map(function (transaction) {
    balance += transaction.amount;
    transaction.balance = balance;
    return transaction;
  });
};

Printer.prototype.printOneLine = function (transaction) {
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
  this.addBalanceToEachTransaction();
  this.printHeader();
  var self = this;
  this.listOfTransactions.reverse().forEach(function (transaction) {
    self.printOneLine(transaction);
  })
};

exports.formatCreditTransaction = formatCreditTransaction;
exports.formatDebitTransaction = formatDebitTransaction;
exports.Printer = Printer;
