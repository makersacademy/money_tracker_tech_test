using System;
using System.Text;
using NUnit.Framework;

namespace MakersAcademy.Bank.Tests
{
    [TestFixture]
    public class when_making_multiple_deposits
    {
        [Test]
        public void then_printed_statement_shows_correct_date_and_amounts_for_deposit_and_balance()
        {
            var bankAccount = new BankAccount();

            bankAccount.Deposit(new DateTime(2012, 01, 14), 1000);
            bankAccount.Deposit(new DateTime(2012, 01, 12), 2000);

            var printedStatement = bankAccount.PrintStatement();

            var expectedStatementLines = new StringBuilder();
            expectedStatementLines.Append("date || credit || debit || balance");
            expectedStatementLines.Append(Environment.NewLine);
            expectedStatementLines.Append("14/01/2012 || 1000 || || 1000");
            expectedStatementLines.Append(Environment.NewLine);
            expectedStatementLines.Append("12/01/2012 || 2000 || || 3000");

            Assert.That(printedStatement, Is.EqualTo(expectedStatementLines.ToString()));
        }
    }
}
