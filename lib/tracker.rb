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

  def show_statement
    @formatter.create_statement(@transactions)
  end
end
