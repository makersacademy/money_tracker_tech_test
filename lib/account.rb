require_relative 'transaction'

class Account

  attr_reader :balance, :transactions, :transaction_class

  def initialize(transaction_class)
    @balance = 0
    @transactions = []
    @transaction_class = transaction_class
  end

  def deposit(amount, date)
    deposit = @transaction_class.new(amount, date)
    transactions.push(deposit)
    calculate_balance
    deposit.update_transaction_balance(@balance)
  end

  def withdraw(amount, date)
    withdrawal = @transaction_class.new(-amount, date)
    transactions.push(withdrawal)
    calculate_balance
    withdrawal.update_transaction_balance(@balance)
  end

  private

  def calculate_balance
    amounts = []
    transactions.map { |transaction| amounts.push(transaction.amount)  }
    @balance = amounts.reduce(:+)
  end

end
