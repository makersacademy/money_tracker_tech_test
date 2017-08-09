require_relative 'transaction'

class Tracker
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def record_transaction(transaction)
    @transactions << transaction
  end

  def show_statement
    current_balance = 0
    statement = ''
    statement += create_header
    transactions.each do |transaction|
      current_balance += transaction.amount
      statement += transaction.format_for_statement + ('%.2f' % current_balance).to_s + "\n"
    end
    statement
  end

  private

  def create_header
    "date || earning || spending || balance\n"
  end
end
