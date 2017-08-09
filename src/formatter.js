
function Formatter () {
}

Formatter.prototype.addBalanceToEachTransaction = function (listOfTransactions) {
  var balance = 0;
  return this.sortedListByDateAscending(listOfTransactions).map(function (transaction) {
    balance += transaction.amount;
    transaction.balance = balance;
    return transaction;
  });
};

Formatter.prototype.formatDebitTransaction = function (debit) {
  return ' || || ' + (-debit.amount) + ' || ' + debit.balance
};

Formatter.prototype.formatCreditTransaction = function (credit) {
  return ' || ' + credit.amount + ' || || ' + credit.balance
};

Formatter.prototype.sortedListByDateAscending = function (listOfTransactions) {
  return listOfTransactions.sort(function (a, b) {
    return a.date - b.date
  });
};

Formatter.prototype.revertDateToString = function (date) {
  function pad (s) { return (s < 10) ? '0' + s : s; }
  return [pad(date.getDate()), pad(date.getMonth() + 1), date.getFullYear()].join('/');
};

exports.Formatter = Formatter;
