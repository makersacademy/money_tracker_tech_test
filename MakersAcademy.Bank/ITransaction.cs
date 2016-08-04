using System;

namespace MakersAcademy.Bank
{
    public interface ITransaction
    {
        DateTime DateTime { get; }
        int DepositAmount { get; }
        int WithdrawalAmount { get; }
        int AdjustBalance(int previousBalance);
    }
}