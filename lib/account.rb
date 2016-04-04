require_relative 'statement'
require_relative 'transaction'

class Account
  # is responsible for the customers balance

  attr_reader :balance

  def initialize(transaction_klass = Transaction)
    @balance = 0
    @transactions = []
    @transaction_klass = Transaction
  end

  def history
    @transactions.dup
  end

  def deposit(amount, date = Time.now)
    add(amount)
    record_transaction(@transaction_klass.new(date, amount, 0))
  end

  def withdraw(amount, date = Time.now)
    subtract(amount)
    record_transaction(@transaction_klass.new(date, 0, amount))
  end

  def print_statement
    printout = "date || credit || debit || balance\n"
    

    sum = @balance
    @transactions.reverse.each do |t|
      printout << "#{date_formatted(t.date)} || #{t.credit} || #{t.debit} || #{sum - t.credit + t.debit}\n"
    end
    printout
  end

  def add_to_print(list, sum)
    t = list.pop
    printout << "#{date_formatted(t.date)} || #{t.credit} || #{t.debit} || #{sum - t.credit + t.debit}\n"
  end

  private

  def date_formatted(date)
    year = date.year > 9 ? "#{date.year}" : "0#{date.year}"
    month = date.month > 9 ? "#{date.month}" : "0#{date.month}"
    day = date.day > 9 ? "#{date.day}" : "0#{date.day}"
    "#{day}/#{month}/#{year}"
  end


  def record_transaction(transaction)
    @transactions << transaction
  end

  def add(amount)
    @balance += amount
  end

  def subtract(amount)
    @balance -= amount
  end

end
