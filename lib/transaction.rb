require_relative 'tracker'
require 'date'

class Transaction
  attr_reader :date, :amount

  def initialize(date, amount)
    check_if_valid(date, amount)
    @date = date
    @amount = amount
  end

  def format_for_statement
    @date + ' || ' + format_amount_for_statement
  end

  private

  def check_if_valid(date, amount)
    raise 'The date must be a string' unless date.is_a? String
    raise 'The date cannot include characters' if date.match(/[a-zA-Z]/)
    begin
      Date.parse(date)
    rescue ArgumentError
      raise "The date format must be dd/mm/yyyy"
    end
    raise 'The amount cannot be 0' if amount.zero?
  end

  def format_amount_for_statement
    @amount > 0 ? format_earning : format_spending
  end

  def format_earning
    ('%.2f' % @amount).to_s + ' || || '
  end

  def format_spending
    '|| ' + ('%.2f' % (@amount * -1)).to_s + ' || '
  end
end
