
function addBalanceToEachTransaction (listOfTransactions) {
  var balance = 0;
  sortedTransactionsByDateAscending(listOfTransactions).map(function (transaction) {
    balance += transaction.amount;
    transaction.balance = balance;
    return transaction;
  });
};

function formatDebitTransaction (debit) {
  return debit.date + ' || || ' + (-debit.amount) + ' || ' + debit.balance
};

function formatCreditTransaction (credit) {
  return credit.date + ' || ' + credit.amount + ' || || ' + credit.balance
};

function sortedTransactionsByDateAscending (listOfTransactions) {
  return listOfTransactions.sort(function (a, b) {
    return a.date - b.date
  })
}

exports.addBalanceToEachTransaction = addBalanceToEachTransaction;
exports.sortedTransactionsByDateAscending = sortedTransactionsByDateAscending;
exports.formatCreditTransaction = formatCreditTransaction;
exports.formatDebitTransaction = formatDebitTransaction;
