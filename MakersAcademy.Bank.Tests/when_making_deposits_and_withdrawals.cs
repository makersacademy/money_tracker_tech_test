using System;
using System.Text;
using NUnit.Framework;

namespace MakersAcademy.Bank.Tests
{
    [TestFixture]
    public class when_making_deposits_and_withdrawals
    {

        [Test]
        public void then_printed_statement_shows_correct_transactions_and_balance_and_descending_date_order()
        {
            var bankAccount = new BankAccount();

            bankAccount.Deposit(new DateTime(2012, 01, 10), 1000);
            bankAccount.Deposit(new DateTime(2012, 01, 13), 2000);
            bankAccount.Withdraw(new DateTime(2012, 01, 14), 500);

            var printedStatement = bankAccount.CreateStatement();

            var expectedStatementLines = new StringBuilder();
            expectedStatementLines.Append("date || credit || debit || balance");
            expectedStatementLines.Append(Environment.NewLine);
            expectedStatementLines.Append("14/01/2012 || || 500 || 2500");
            expectedStatementLines.Append(Environment.NewLine);
            expectedStatementLines.Append("13/01/2012 || 2000 || || 3000");
            expectedStatementLines.Append(Environment.NewLine);
            expectedStatementLines.Append("10/01/2012 || 1000 || || 1000");

            Assert.That(printedStatement, Is.EqualTo(expectedStatementLines.ToString()));
        }
    }
}