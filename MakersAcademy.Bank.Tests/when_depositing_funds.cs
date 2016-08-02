using System;
using NUnit.Framework;

namespace MakersAcademy.Bank.Tests
{
    [TestFixture]
    public class when_depositing_funds
    {
        [Test]
        public void then_printed_statement_shows_correct_date_and_amounts_for_deposit_and_balance()
        {
            var bankAccount = new BankAccount();

            bankAccount.Deposit(new DateTime(2012, 01, 10), 1000);
            var printedStatement = bankAccount.PrintStatement();

            Assert.That(printedStatement, Is.EqualTo("date || credit || debit || balance\r\n14/01/2012 || 2000 || || 2000"));
        }
    }
}
