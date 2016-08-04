using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MakersAcademy.Bank
{
    public class BankAccount
    {
        private readonly IList<Transaction> _transactions = new List<Transaction>();

        public void Deposit(DateTime dateTime, int amount)
        {
            _transactions.Add(new Deposit(dateTime, amount));
        }

        public void Withdraw(DateTime dateTime, int amount)
        {
            _transactions.Add(new Withdrawal(dateTime, amount));
        }

        public string CreateStatement()
        {
            var statementLines = GenerateStatementLines();

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
            return statement.ToString();
        }

        private IEnumerable<StatementLine> GenerateStatementLines()
        {
            var runningBalance = 0;
            var statementLines = new List<StatementLine>();

            foreach (var transaction in _transactions.OrderBy(t => t.DateTime))
            {
                var newLine = new StatementLine(transaction, runningBalance);
                statementLines.Add(newLine);

                runningBalance = newLine.RunningBalance;
            }
            return statementLines;
        }
    }
}