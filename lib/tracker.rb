require_relative 'transaction'
require 'date'

class Tracker
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def record_transaction(transaction)
    @transactions << transaction
  end

  # def show_statement
  #   create_header
  #   @transactions.map do |transaction|
  #     transaction.format_for_statement
  #   end.join("\n")
  # end

  # private
  #   def calculate_balance
  #     @balance = 0
  #     @transactions.each do |transaction|
  #       @balance += transaction.amount
  #     end
  #   end

    # def create_header
    #   p "date || credit || debit || balance\n"
    # end
end
