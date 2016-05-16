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
    var output = statement.print();
    $('#statement').text(output);
  });
});
