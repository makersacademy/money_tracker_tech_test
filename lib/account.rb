class Account

  attr_reader :balance, :transaction_log
  STARTING_BALANCE = 0

  def initialize(transaction_log)
    @transaction_log = transaction_log
  end

  def calculate_balance
    transaction_log.calculate_balance(STARTING_BALANCE)
  end

end
