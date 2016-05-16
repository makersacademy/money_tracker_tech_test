require 'matrix'

class Statement

  attr_reader :balance, :log
  
  def initialize(args)
    @balance ||= args[:balance_class].new
    @deposit_class = args[:deposit_class]
    @withdraw_class = args[:withdraw_class]
    @log = [["Date", "Creadit", "Debit", "Balance"]]
  end

  def new_transaction(amount)
    create_deposit(amount) if amount>0
    create_withdraw(amount) if amount<0
  end

  def latest_balance
    raise "No transaction yet" if log.empty?
    log.last[1]
  end

  def complete_log
    log.each{|a| puts a.join("|| \t")}
  end

private

  def create_deposit(amount)
    deposit = @deposit_class.new(amount)
    update_balance(deposit)
  end

  def create_withdraw(amount)
    withdraw = @withdraw_class.new(amount)
    update_balance(withdraw)
  end

  def update_balance(transaction_type)
    balance.update(transaction_type.amount)
    save_to_statement(transaction_type)
  end

  def save_to_statement(object)
    @log <<[object.date, object.amount, balance.amount]
  end
end