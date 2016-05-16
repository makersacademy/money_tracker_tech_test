class Account

  attr_reader :balance, :transaction_log

  def initialize(transaction_log)
    @transaction_log = transaction_log
    @balance = transaction_log.total
  end

end
