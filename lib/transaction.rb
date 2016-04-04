class Transaction

  attr_reader :amount, :type, :date, :start_balance, :end_balance

  def initialize(amount, type, date, start_balance)
    @amount = amount
    @type = type
    @date = date
    @start_balance = start_balance
    @end_balance = calculate_balance(start_balance, amount)
  end

  private

  def calculate_balance(start_balance, amount)
    start_balance += amount
  end


end
