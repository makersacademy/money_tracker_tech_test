class Transaction

  attr_reader :amount, :date, :balance_after_transaction

  def initialize(amount, date)
    @amount = amount
    @date = date
    @balance_after_transaction = 0
  end

  def update_transaction_balance(account_balance)
    @balance_after_transaction = account_balance
  end

end
