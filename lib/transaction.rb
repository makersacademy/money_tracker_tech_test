require_relative 'tracker'

class Transaction
  attr_reader :date, :amount

  def initialize(date, amount)
    @date = date
    @amount = amount
  end

  # def format_for_statement
  #   p @date + " || " + @credit.to_s + " || " + @debit.to_s + " || " + @current_balance.to_s
  # end
end
