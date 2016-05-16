'use strict';

function Statement(account) {
  this._transactionHistory = account.getTransactionHistory();
  this._header = 'date || credit || debit || balance';
};

Statement.prototype.print = function (filter) {
  var history = this._filterHistory(filter);
  var list = this._formatList(history);
  return this._header + '\n' + list;
};

Statement.prototype._filterHistory = function (filter) {
  if (filter === 'descending') {
    return this._transactionHistory.reverse();
  }
  if (filter === 'ascending') {
    return this._transactionHistory;
  }
  if (filter === 'deposits') {
    return this._transactionHistory.filter(function (transaction) {
      return transaction.isDeposit();
    });
  }
  if (filter === 'withdrawals') {
    return this._transactionHistory.filter(function (transaction) {
      return !transaction.isDeposit();
    });
  }
};

Statement.prototype._formatList = function (history) {
  var self = this;
  var list = '';
  history.forEach(function (transaction) {
    if (self._isLastRow(history, transaction)) {
      list = list + self._formatRow(transaction);
    } else {
      list = list + self._formatRow(transaction) + '\n';
    }
  });
  return list;
};

Statement.prototype._formatRow = function (transaction) {
  var date = this._formatDate(transaction);
  var amount = this._formatAmount(transaction);
  var balance = this._formatBalance(transaction);
  return date + ' || ' + amount + ' || ' + balance;
};

Statement.prototype._formatDate = function (transaction) {
  var month = transaction.getDate().getMonth() + 1;
  if (month < 10) {
    month = '0' + month.toString();
  }
  var day = transaction.getDate().getDate();
  var year = transaction.getDate().getFullYear();
  return day + '/' + month + '/' + year;
};

Statement.prototype._formatAmount = function (transaction) {
  var amount = transaction.getAmount().toFixed(2);
  if (transaction.isDeposit()) {
    return amount + ' ||';
  } else {
    return '|| ' + amount;
  }
};

Statement.prototype._formatBalance = function (transaction) {
  return transaction.getBalance().toFixed(2);
};

Statement.prototype._isLastRow = function (list, row) {
  return list.indexOf(row) === list.length - 1;
};
