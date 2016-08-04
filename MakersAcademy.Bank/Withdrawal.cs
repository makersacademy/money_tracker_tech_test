using System;

namespace MakersAcademy.Bank
{
    internal class Withdrawal : Transaction
    {
        internal Withdrawal(DateTime dateTime, int amount) : base(dateTime, withdrawalAmount: amount, depositAmount: 0)
        {
        }
    }
}