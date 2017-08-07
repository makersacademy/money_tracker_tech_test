require 'date'

class Record
  attr_reader :date, :amount, :type

  def initialize(date, amount)
    @date   = Date.parse(date)
    @amount = check_amount(amount)
    @type   = determine_transaction_type(amount)
  end

  private

  def check_amount(amount)
    raise 'Invalid transaction amount' if amount.to_f.zero?
    amount.to_f
  end

  def determine_transaction_type(amount)
    amount >= 0 ? 'Credit' : 'Debit'
  end
end
