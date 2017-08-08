require_relative 'tracker'

class Transaction
  attr_reader :date, :amount

  def initialize(date, amount)
    @date = date
    @amount = amount
  end

  def format_for_statement
    @date + " || " + check_if_credit_or_debit
  end

  private
    def check_if_credit_or_debit
      if @amount > 0
        @amount.to_s + " || || "
      else
        "|| " + @amount.to_s + " || "
      end
    end
end
