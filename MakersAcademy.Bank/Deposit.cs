using System;

namespace MakersAcademy.Bank
{
    internal class Deposit : Transaction
    {
        internal Deposit(DateTime dateTime, int amount) : base(dateTime, depositAmount: amount, withdrawalAmount: 0)
        {
        }
    }
}