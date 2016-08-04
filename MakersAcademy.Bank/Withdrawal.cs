using System;

namespace MakersAcademy.Bank
{
    public class Withdrawal : Transaction
    {
        public Withdrawal(DateTime dateTime, int amount) : base(dateTime, withdrawalAmount: amount, depositAmount: 0)
        {
        }
    }
}