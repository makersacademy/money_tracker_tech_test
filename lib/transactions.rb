require_relative 'earning'
require_relative 'spending'

class Transactions

  attr_reader :transaction_list

  def initialize
    @transaction_list = []
  end

  def add_transaction(type, amount, datestring)
    transaction_list.push(create_transaction(type, amount, datestring))
  end

  private

  def create_transaction(type, amount, datestring)
    type.new(amount, datestring)
  end


end
