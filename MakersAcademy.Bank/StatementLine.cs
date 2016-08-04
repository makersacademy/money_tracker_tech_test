using System;

namespace MakersAcademy.Bank
{
    internal class StatementLine
    {
        internal DateTime DateTime { get; }
        internal string DepositValue { get; }
        internal string WithdrawalValue { get; }
        internal int RunningBalance { get; }

        internal StatementLine(Transaction transaction, int previousBalance)
        {
            DateTime = transaction.DateTime;
            DepositValue = transaction.DepositAmount > 0 ? transaction.DepositAmount + " " : "";
            WithdrawalValue = transaction.WithdrawalAmount > 0 ? transaction.WithdrawalAmount + " " : "";
            RunningBalance = transaction.AdjustBalance(previousBalance);
        }
    }
}