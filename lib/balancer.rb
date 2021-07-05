
# Understands how to find a net balance

class Balancer
  STARTING_BALANCE = 0

  def initialize
    @balance = STARTING_BALANCE
  end

  def update(transaction)
    transaction.debit == 0 ? @balance += transaction.credit : @balance -= transaction.debit
    @balance
  end
end
