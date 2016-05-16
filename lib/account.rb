require_relative 'deposit.rb'
require_relative 'withdrawal.rb'

class Account

  attr_reader :transactions, :deposit_class, :withdrawal_class

  def initialize(deposit_class = Deposit, withdrawal_class = Withdrawal)
    @transactions = []
    @deposit_class = deposit_class
    @withdrawal_class = withdrawal_class
  end

  def print_statement
    "#{statement_columns}\n#{transaction_list}"
  end

  def deposit(amount)
    @transactions << @deposit_class.new(amount)
  end

  def withdraw(amount)
    @transactions << @withdrawal_class.new(amount)
  end

  def balance
    arr = []
    transactions.map{ |t| arr << t.amount }
    p arr
    p arr.reduce(:+)
    return 0 if arr.reduce(:+) == nil
    arr.reduce(:+)
  end

private

  def statement_columns
    "date || credit || debit || balance"
  end

  def transaction_list
    list = ""
    transactions.each { |t|
      list << "#{t.date} || #{t.amount} || #{balance}\n"
    }
    list
  end

end
