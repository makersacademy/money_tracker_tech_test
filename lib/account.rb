require_relative 'transaction'

class Account

  attr_reader :balance, :statement

  def initialize(transaction_klass = Transaction)
    @balance = 0
    @statement = []
    @transaction_klass = transaction_klass
  end

  def deposit(amount: amount, date: date)
    @balance += amount
    transaction = @transaction_klass.new(date: date, deposit: amount, balance: @balance)
    @statement << transaction
  end

  def withdraw(amount: amount, date: date)
    @balance -= amount
    transaction = @transaction_klass.new(date: date, withdrawal: amount, balance: @balance)
    @statement << transaction
  end

  def print
    @statement.map do |transaction|
      p "#{transaction.date} || #{transaction.deposit} || #{transaction.withdrawal} || #{transaction.balance}"
    end
  end

end
