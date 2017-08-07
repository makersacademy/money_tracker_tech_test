require_relative 'income'
require_relative 'expense'

class Transactions

  attr_reader :transaction_list

  def initialize
    @transaction_list = []
  end

  def add_transaction(type, description, amount, datestring)
    transaction_list.push(create_transaction(type, description, amount, datestring))
  end

  private

  def create_transaction(type, description, amount, datestring)
    type.new(description, amount, datestring)
  end


end
