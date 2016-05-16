require_relative 'transaction'

class Account

  attr_reader :balance, :transactions, :transaction_class

  def initialize(transaction_class)
    @balance = 0
    @transactions = []
    @transaction_class = transaction_class
  end

  def credit(amount, date)
    credit_transaction = @transaction_class.new(amount, date)
    transactions.push(credit_transaction)
    calculate_balance
    credit_transaction.update_transaction_balance(@balance)
  end

  def debit(amount, date)
    transactions.push(@transaction_class.new(-amount, date))
    calculate_balance
  end

  private

  def calculate_balance
    amounts = []
    transactions.map { |transaction| amounts.push(transaction.amount)  }
    @balance = amounts.reduce(:+)
  end

end
