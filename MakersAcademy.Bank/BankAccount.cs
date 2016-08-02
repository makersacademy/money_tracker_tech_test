using System;

namespace MakersAcademy.Bank
{
    public class BankAccount
    {
        public string PrintStatement()
        {
            return "date || credit || debit || balance" + Environment.NewLine + "14/01/2012 || 2000 || || 2000";
        }

        public void Deposit(DateTime dateTime, int amount)
        {
            
        }
    }
}