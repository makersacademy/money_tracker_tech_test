$(document).ready(function () {
  var bankAccount = new BankAccount(Transaction);

  $('#deposit').click(function () {
    var amount = $('#amount').val();
    bankAccount.deposit(parseInt(amount));
  });

  $('#withdraw').click(function () {
    var amount = $('#amount').val();
    bankAccount.withdraw(parseInt(amount));
  });

  $('#print-statement').click(function () {
    var statement = new Statement(bankAccount);
    var filter;
    if ($('#ascending').is(':checked')) {
      filter = 'ascending';
    } else if ($('#deposits-only').is(':checked')) {
      filter = 'deposits';
    } else if ($('#withdrawals-only').is(':checked')) {
      filter = 'withdrawals';
    } else {
      filter = 'descending';
    }
    var output = statement.print(filter);
    $('#statement').text(output);
  });
});
