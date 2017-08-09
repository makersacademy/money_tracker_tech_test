require_relative 'tracker'

class Transaction
  attr_reader :date, :amount

  def initialize(date, amount)
    check(date, amount)
    @date = Date.parse(date).strftime('%d/%m/%Y')
    @amount = amount
  end

  def format_for_statement
    @date + ' || ' + check_if_credit_or_debit
  end

  private

  def check(date, amount)
    raise 'The date must be a string' unless date.is_a? String
    raise 'The amount cannot be 0' if amount.zero?
  end

  def check_if_credit_or_debit
    if @amount > 0
      ('%.2f' % @amount).to_s + ' || || '
    else
      '|| ' + ('%.2f' % (@amount * -1)).to_s + ' || '
    end
  end
end
