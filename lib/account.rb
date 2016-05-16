require_relative 'transaction.rb'

class Account

  attr_reader :transactions, :transaction_class

  def initialize(transaction_class = Transaction)
    @transactions = []
    @transaction_class = transaction_class
  end

  def print_statement
    "#{statement_columns}\n#{transaction_list}"
  end

  def deposit(amount)
    @transactions << @transaction_class.new(amount)
  end

  def withdraw(amount)
    @transactions << @transaction_class.new(-amount)
  end

  def balance
    arr = []
    transactions.map{ |t| arr << t.amount }
    p "REDUCE #{arr.reduce(:+)}"
    return 0 if arr.reduce(:+) == nil
    arr.reduce(:+)
  end

private

  def statement_columns
    "date || credit || debit || balance"
  end

  def transaction_list
    list = ""
    @transactions.each { |t| list << "#{t.balance_at_transaction}\n" }
    list
  end

end
