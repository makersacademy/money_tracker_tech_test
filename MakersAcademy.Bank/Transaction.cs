using System;

namespace MakersAcademy.Bank
{
    public class Transaction 
    {
        public DateTime DateTime { get; }
        public int DepositAmount { get; }
        public int WithdrawalAmount { get; }

        public Transaction(DateTime dateTime, int depositAmount, int withdrawalAmount)
        {
            DateTime = dateTime;
            DepositAmount = depositAmount;
            WithdrawalAmount = withdrawalAmount;
        }

        public int AdjustBalance(int previousBalance)
        {
            return previousBalance + DepositAmount - WithdrawalAmount;
        }
    }
}