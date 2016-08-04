using System;

namespace MakersAcademy.Bank
{
    public class Deposit : ITransaction
    {
        public DateTime DateTime { get; }
        public int DepositAmount { get; }
        public int WithdrawalAmount { get; }

        public int AdjustBalance(int previousBalance)
        {
            return previousBalance + DepositAmount - WithdrawalAmount;
        }

        public Deposit(DateTime dateTime, int amount)
        {
            DateTime = dateTime;
            DepositAmount = amount;
            WithdrawalAmount = 0;
        }
    }
}