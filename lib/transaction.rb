class Transaction
  def initialize(amount, balance)
    @date = Time.new
    @amount = amount
    @balance = balance
  end

  attr_reader :date, :amount, :balance

  def pretty_date
    date.strftime('%d/%m/%y')
  end

  def self.can_deposit(amount)
    (amount.is_a? Numeric) && amount > 0
  end

  def self.can_withdraw(amount)
    (amount.is_a? Numeric) && amount > 0
  end
end
