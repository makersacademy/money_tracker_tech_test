class Account

  attr_reader :balance, :previous_transactions, :current_transaction

  def initialize
    @balance = 0
    @previous_transactions = []
    # @current_transaction = {}
  end

  def accept_deposit(amount)
    update_balance(amount)
    transaction = "#{Time.now.strftime("%d/%m/%Y")} | #{amount} |      | #{@balance} "
    @previous_transactions << transaction
  end

  def accept_withdrawal(amount)
    update_balance(-amount)
    transaction = "#{Time.now.strftime("%d/%m/%Y")} |      |  #{amount} | #{@balance} "
    @previous_transactions << transaction
  end

  def print_statement
    statement = "Date | credit | debit | balance"
    @previous_transactions.each do |transaction|
      statement << "\n" + transaction
    end
    return statement
  end

  private

  def update_balance(amount)
    @balance += amount
  end





end
