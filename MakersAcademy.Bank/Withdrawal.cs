using System;

namespace MakersAcademy.Bank
{
    public class Withdrawal : ITransaction
    {
        public DateTime DateTime { get; }
        public int DepositAmount { get; }
        public int WithdrawalAmount { get; }

        public int AdjustBalance(int previousBalance)
        {
            return previousBalance + DepositAmount - WithdrawalAmount;
        }

        public Withdrawal(DateTime dateTime, int amount)
        {
            DateTime = dateTime;
            WithdrawalAmount = amount;
            DepositAmount = 0;
        }
    }
}