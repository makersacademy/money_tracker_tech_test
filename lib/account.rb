class Account

  attr_reader :balance, :transaction_log

  def initialize(transaction_log)
    @balance = 0
    @transaction_log = transaction_log
  end

end
