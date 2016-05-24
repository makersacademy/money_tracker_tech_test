require './lib/history'

class Account

  attr_reader :history

  def initialize(history: History.new)
    @history = history
  end

  def deposit(amount, date = Date.today)
    @history.deposit(amount, date)
  end

  def withdraw(amount, date = Date.today)
    @history.withdraw(amount, date)
  end

  def print_statement(output = STDOUT)
    balance = 0
    statement_rows = []

    @history.transactions.each do |transaction|
      balance += transaction.amount
      statement_rows << "#{format_row(transaction)} #{'%.2f' % balance}\n"
    end
    
    result = "date || credit || debit || balance\n#{statement_rows.reverse.join}"
    output.puts(result)
  end

  private

  def format_row(transaction)
    "#{format_date(transaction.date)} || #{format_amount(transaction.amount)} ||"
  end

  def format_date(date)
    "#{date.strftime("%d/%m/%Y")}"
  end

  def format_amount(amount)
    negative_amount = (amount-(amount*2))
    amount < 0 ? "|| #{'%.2f' % negative_amount}" : "#{'%.2f' % amount} ||"
  end
end
