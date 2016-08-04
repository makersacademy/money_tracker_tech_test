using System;

namespace MakersAcademy.Bank
{
    public class Deposit : Transaction
    {
        public Deposit(DateTime dateTime, int amount) : base(dateTime, depositAmount: amount, withdrawalAmount: 0)
        {
        }
    }
}