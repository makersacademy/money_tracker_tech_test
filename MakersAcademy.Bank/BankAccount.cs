using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace MakersAcademy.Bank
{
    public class BankAccount
    {
        private readonly IList<Deposit> _deposits = new List<Deposit>();

        public string PrintStatement()
        {
            var statement = new StringBuilder();
            statement.Append("date || credit || debit || balance");

            var runningBalance = 0;

            foreach (var deposit in _deposits)
            {
                runningBalance = AdjustBalance(runningBalance, deposit.Amount);

                statement.Append(Environment.NewLine);
                statement.Append(deposit.DateTime.ToShortDateString());
                statement.Append(" || ");
                statement.Append(deposit.Amount);
                statement.Append(" || || ");
                statement.Append(runningBalance);
            }

            return statement.ToString();
        }

        private int AdjustBalance(int runningBalance, int amount)
        {
            return runningBalance + amount;
        }

        public void Deposit(DateTime dateTime, int amount)
        {
            _deposits.Add(new Deposit(dateTime, amount));
        }
    }

    public class Deposit
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