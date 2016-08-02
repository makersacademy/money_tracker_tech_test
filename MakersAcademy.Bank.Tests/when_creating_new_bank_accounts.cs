using NUnit.Framework;

namespace MakersAcademy.Bank.Tests
{
    [TestFixture]
    public class when_creating_new_bank_accounts
    {
        [Test]
        public void then_bank_statement_only_has_headers()
        {
            var bankAccount = new BankAccount();

            var printedStatement = bankAccount.PrintStatement();

            Assert.That(printedStatement, Is.EqualTo("date || credit || debit || balance"));
        }
    }
}
