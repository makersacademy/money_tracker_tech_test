require_relative 'transaction'
require_relative 'statement_formatter'

class Tracker
  attr_reader :transactions, :formatter

  def initialize(formatter = StatementFormatter.new)
    @transactions = []
    @formatter = formatter
  end

  def record_transaction(transaction)
    @transactions << transaction
  end

  # def show_statement
  #   current_balance = 0
  #   statement = ''
  #   statement += create_header
  #   transactions.each do |transaction|
  #     current_balance += transaction.amount
  #     statement += transaction.format_for_statement + ('%.2f' % current_balance).to_s + "\n"
  #   end
  #   statement
  # end

end
