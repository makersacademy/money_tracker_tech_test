using System;
using NUnit.Framework;

namespace MakersAcademy.Bank.Tests
{
    [TestFixture]
    public class when_making_single_deposits
    {
        [TestCaseSource("TestInput")]
        public void then_printed_statement_shows_correct_date_and_amounts_for_deposit_and_balance(DateTime depositDate, int depositAmount, string expectedStatementLine)
        {
            var bankAccount = new BankAccount();

            bankAccount.Deposit(depositDate, depositAmount);
            var printedStatement = bankAccount.PrintStatement();

            Assert.That(printedStatement, Is.EqualTo("date || credit || debit || balance" + Environment.NewLine + expectedStatementLine));
        }

        private object[] TestInput =
        {
            new object[] { new DateTime(2012, 01, 14), 1000, "14/01/2012 || 1000 || || 1000" },
            new object[] { new DateTime(2012, 01, 12), 2000, "12/01/2012 || 2000 || || 2000" }
        };
    }
}
