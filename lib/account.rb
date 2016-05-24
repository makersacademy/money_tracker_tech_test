require_relative 'deposit.rb'
require_relative 'withdrawal.rb'

class Account

  attr_reader :transactions, :deposit_class, :withdrawal_class

  def initialize(deposit_class = Deposit, withdrawal_class = Withdrawal)
    @transactions = []
    @deposit_class = deposit_class
    @withdrawal_class = withdrawal_class
    @current_balance = 0
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

  def balance_at_transaction(index = 0)
    arr = transactions.map{ |t| t.amount }
    return 0 if arr.reduce(:+) == nil
    arr[0..index].reduce(:+)
  end

private

  def statement_columns
    "date || credit || debit || balance"
  end

  def transaction_list
    list = ""
    transactions.each_with_index do |t,i|
      list << "#{t.date} || #{deposit_or_withdrawal(t)} || #{balance_at_transaction(i)}\n"
    end
    list
  end

  def deposit_or_withdrawal(transaction)
    "#{transaction.amount if transaction.amount > 0} || #{transaction.amount if transaction.amount < 0}"
  end

end
