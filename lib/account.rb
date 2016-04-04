class Account

  attr_reader :balance, :previous_transactions, :current_transaction

  def initialize
    @balance = 0
    @previous_transactions = []
    # @current_transaction = {}
  end

  def accept_deposit(amount)
    update_balance(amount)
    transaction = {Time.now.strftime("%d/%m/%Y") => amount}
    @previous_transactions << transaction
  end

  def accept_withdrawal(amount)
    update_balance(-amount)
    transaction = {Time.now.strftime("%d/%m/%Y") => -amount}
    @previous_transactions << transaction
  end

  private

  def update_balance(amount)
    @balance += amount
  end

end
