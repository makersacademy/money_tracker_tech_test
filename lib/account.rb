require_relative 'transaction.rb'

class Account

  attr_reader :balance, :statement

  def initialize(transaction_klass = Transaction)
    @balance = 0
    @statement = []
    @transaction = transaction_klass
  end

  def deposit(amount, date)
    transaction = @transaction.new(amount, 'deposit', date, @balance)
    @balance = transaction.end_balance
    @statement.push(transaction)
  end

end
