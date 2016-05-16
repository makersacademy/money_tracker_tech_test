class Transaction
  def initialize(date, amount, balance)
    @date = date
    @amount = amount
    @balance = balance
  end

  attr_reader :date, :amount, :balance

  def self.can_deposit(amount)
    (amount.is_a? Numeric) && amount > 0
  end

  def self.can_withdraw(amount)
    (amount.is_a? Numeric) && amount > 0
  end
end
