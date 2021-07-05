
# Understands how to represent aspects of a monetary flow.

require_relative 'transaction_log'

class Transaction
  attr_reader :credit, :debit, :time

  def initialize(credit: 0, debit: 0, time: Time.new)
    @credit = credit
    @debit = debit
    @time = time
    TransactionLog.instance.log(self)
  end
end
