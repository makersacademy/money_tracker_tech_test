using System;

namespace MakersAcademy.Bank
{
    public class StatementLine
    {
        public DateTime DateTime { get; }
        public string DepositValue { get; }
        public string WithdrawalValue { get; }
        public int RunningBalance { get; }

        public StatementLine(Transaction transaction, int previousBalance)
        {
            DateTime = transaction.DateTime;
            DepositValue = transaction.DepositAmount > 0 ? transaction.DepositAmount + " " : "";
            WithdrawalValue = transaction.WithdrawalAmount > 0 ? transaction.WithdrawalAmount + " " : "";
            RunningBalance = transaction.AdjustBalance(previousBalance);
        }
    }
}