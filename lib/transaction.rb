require 'Date'

class Transaction
  attr_reader :credit, :debit, :date
  attr_writer :current_balance

  def initialize(credit: nil,
                 debit: nil,
                 date: date)
    @credit = credit
    @debit = debit
    @date = date || Date.new
  end

  def current_balance(new_balance)
    @current_balance = new_balance
  end
end
