class Account

  attr_reader :balance, :history

  def initialize(transaction_class = Transaction)
    @transaction_class = transaction_class
    @balance = 0
    @history = []
  end

  def withdraw(amount)
    @transaction_class.new(amount)
  end
end
