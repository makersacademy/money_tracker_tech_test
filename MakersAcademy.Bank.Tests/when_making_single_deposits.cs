using System;
using NUnit.Framework;

namespace MakersAcademy.Bank.Tests
{
    [TestFixture]
    public class when_making_single_deposits
    {
        [TestCase("14/01/2012", 1000, "14/01/2012 || 1000 || || 1000")]
        [TestCase("12/01/2012", 2000, "12/01/2012 || 2000 || || 2000")]
        public void then_printed_statement_shows_correct_date_and_amounts_for_deposit_and_balance(string depositDate, int depositAmount, string expectedStatementLine)
        {
            var bankAccount = new BankAccount();

            bankAccount.Deposit(DateTime.Parse(depositDate), depositAmount);
            var printedStatement = bankAccount.PrintStatement();

            Assert.That(printedStatement, Is.EqualTo("date || credit || debit || balance" + Environment.NewLine + expectedStatementLine));
        }
    }
}
