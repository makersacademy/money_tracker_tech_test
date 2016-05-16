require_relative 'transaction'

class TransactionHistory

  attr_reader :transaction, :history, :date, :amount

  def initialize(transaction: Transaction)
    @transaction = transaction
    @history = []
  end

  def add(date, amount)
    @current_transaction = @transaction.new
    @current_transaction.value(date, amount)
    @history << @current_transaction.details
    balance
  end

  def balance
    @history[-1][:balance] + amount
    @history.each { |detail| balance << detail[:amount] }
    @current_transaction.details[:balance] = balance.reduce(:+)
  end
end
