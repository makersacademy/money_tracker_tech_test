require_relative 'tracker'
require_relative 'statement_formatter'
require 'date'

class Transaction
  attr_reader :date, :amount

  def initialize(date, amount)
    check_date_if_valid(date)
    check_amount_if_valid(amount)
    @date = date
    @amount = amount
  end

  private

  def check_date_if_valid(date)
    raise 'The date must be a string' unless date.is_a? String
    raise 'The date cannot include characters' if date.match(/[a-zA-Z]/)
    d, m, y = date.split '/'
    raise "The date format must be dd/mm/yyyy" unless Date.valid_date? y.to_i, m.to_i, d.to_i
  end

  def check_amount_if_valid(amount)
    raise 'The amount cannot be 0' if amount.zero?
  end
end
