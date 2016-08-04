using System;

namespace MakersAcademy.Bank
{
    internal class Transaction 
    {
        internal DateTime DateTime { get; }
        internal int DepositAmount { get; }
        internal int WithdrawalAmount { get; }

        internal Transaction(DateTime dateTime, int depositAmount, int withdrawalAmount)
        {
            DateTime = dateTime;
            DepositAmount = depositAmount;
            WithdrawalAmount = withdrawalAmount;
        }

        internal int AdjustBalance(int previousBalance)
        {
            return previousBalance + DepositAmount - WithdrawalAmount;
        }
    }
}