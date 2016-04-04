class Account

  attr_reader :balance, :previous_transactions, :current_transaction

  def initialize
    @balance = 0
    @previous_transactions = []
    # @current_transaction = {}
  end

  def accept_deposit(amount)
    @balance += amount
    time_to_save = Time.now.strftime("%d/%m/%Y")
    transaction = {time_to_save => amount}
    @previous_transactions << transaction
  end

  def accept_withdrawal(amount)
    @balance -= amount
    time_to_save = Time.now.strftime("%d/%m/%Y")
    transaction = {time_to_save => -amount}
    @previous_transactions << transaction
  end


end
