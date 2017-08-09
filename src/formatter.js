
function addBalanceToEachTransaction (listOfTransactions) {
  var balance = 0;
  sortedTransactionsByDateAscending(listOfTransactions).map(function (transaction) {
    balance += transaction.amount;
    transaction.balance = balance;
    return transaction;
  });
};

function formatDebitTransaction (debit) {
  return ' || || ' + (-debit.amount) + ' || ' + debit.balance
};

function formatCreditTransaction (credit) {
  return ' || ' + credit.amount + ' || || ' + credit.balance
};

function sortedTransactionsByDateAscending (listOfTransactions) {
  return listOfTransactions.sort(function (a, b) {
    return a.date - b.date
  });
};

function revertDateToString (date) {
  function pad (s) { return (s < 10) ? '0' + s : s; }
  return [pad(date.getDate()), pad(date.getMonth() + 1), date.getFullYear()].join('/');
};

exports.addBalanceToEachTransaction = addBalanceToEachTransaction;
exports.sortedTransactionsByDateAscending = sortedTransactionsByDateAscending;
exports.formatCreditTransaction = formatCreditTransaction;
exports.formatDebitTransaction = formatDebitTransaction;
exports.revertDateToString = revertDateToString;
