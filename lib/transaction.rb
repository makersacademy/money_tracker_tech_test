private

class Transaction

attr_reader :date, :type, :amount, :client_balance

  def initialize(amount, type, client_balance)
    @amount = amount
    @type = type
    @client_balance = client_balance
    @date = Time.now
  end

  def make
    credit? ? add : subtract
  end

  def credit?
    type == :credit
  end

  def add
    @client_balance += amount
  end

  def subtract
    @client_balance -= amount
  end

end
