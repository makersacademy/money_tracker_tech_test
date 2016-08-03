using System;
using System.CodeDom;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MakersAcademy.Bank
{
    public class BankAccount
    {
        private readonly IList<ITransaction> _transactions = new List<ITransaction>();

        public string PrintStatement()
        {
            var statementLines = GenerateStatementLines();

            var statement = BuildStatement(statementLines);

            return statement.ToString();
        }

        private static StringBuilder BuildStatement(IEnumerable<StatementLine> statementLines)
        {
            var statement = new StringBuilder();
            const string statementHeader = "date || credit || debit || balance";

            statement.Append(statementHeader);

            foreach (var line in statementLines.OrderByDescending(sl => sl.DateTime))
            {
                statement.Append(Environment.NewLine);
                statement.Append(line.DateTime.ToString("dd'/'MM'/'yyyy"));
                statement.Append(" || ");
                statement.Append(line.DepositValue);
                statement.Append("|| ");
                statement.Append(line.WithdrawalValue);
                statement.Append("|| ");
                statement.Append(line.RunningBalance);
            }
            return statement;
        }

        private IEnumerable<StatementLine> GenerateStatementLines()
        {
            var runningBalance = 0;
            var statementLines = new List<StatementLine>();

            foreach (var transaction in _transactions.OrderBy(t => t.DateTime))
            {
                runningBalance = AdjustBalance(runningBalance, transaction);
                statementLines.Add(new StatementLine(transaction, runningBalance));
            }
            return statementLines;
        }

        private static int AdjustBalance(int previousBalance, ITransaction transaction)
        {
            if (transaction.GetType() == typeof(Deposit))
            {
                return previousBalance + transaction.Amount;
            }
            return previousBalance - transaction.Amount;
        }

        public void Deposit(DateTime dateTime, int amount)
        {
            _transactions.Add(new Deposit(dateTime, amount));
        }

        public void Withdraw(DateTime dateTime, int amount)
        {
            _transactions.Add(new Withdrawal(dateTime, amount));
        }
    }

    public class StatementLine
    {
        public DateTime DateTime { get; }
        public string DepositValue { get; }
        public string WithdrawalValue { get; }
        public int RunningBalance { get; private set; }

        public StatementLine(ITransaction transaction, int newBalance)
        {
            DateTime = transaction.DateTime;
            DepositValue = transaction.GetType() == typeof(Deposit) ? transaction.Amount + " " : "";
            WithdrawalValue = transaction.GetType() == typeof(Withdrawal) ? transaction.Amount + " " : "";
            RunningBalance = newBalance;
        }
    }

    public class Withdrawal : ITransaction
    {
        public DateTime DateTime { get; private set; }
        public int Amount { get; private set; }

        public Withdrawal(DateTime dateTime, int amount)
        {
            DateTime = dateTime;
            Amount = amount;
        }
    }

    public interface ITransaction
    {
        DateTime DateTime { get; }
        int Amount { get; }
    }

    public class Deposit : ITransaction
    {
        public DateTime DateTime { get; private set; }
        public int Amount { get; private set; }

        public Deposit(DateTime dateTime, int amount)
        {
            DateTime = dateTime;
            Amount = amount;
        }
    }
}