require_relative 'transaction'

class Account

  attr_reader :balance, :transactions, :transaction_class, :credit_transaction

  def initialize(transaction_class)
    @balance = 0
    @transactions = []
    @transaction_class = transaction_class
  end

  def credit(amount, date)
    transactions.push(@transaction_class.new(amount, date))
    calculate_balance
  end

  def debit(amount, date)
    transactions.push(@transaction_class.new(-amount, date))
    calculate_balance
  end

  private

  def calculate_balance
  end

end
