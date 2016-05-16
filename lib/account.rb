class Account
  STARTING_BALANCE = 100

  def initialize(log: TransactionHistory.new, transaction: Transaction,
                 balance: STARTING_BALANCE, pin:1234)
    @balance = balance
    @pin = pin
    @log = log
    @transaction = transaction
  end

  attr_reader :balance

  def make_deposit(amount)
    return unless @transaction.can_deposit(amount)
    @balance += amount
    handle_transaction(amount)
  end

  def withdraw(amount, pin)
    return unless can_withdraw(amount) && valid_pin(pin)
    @balance -= amount
    handle_transaction(-amount)
  end

  def print_statement
    @log.print_statement
  end

  private

  def can_withdraw(amount)
    @transaction.can_withdraw(amount) && amount <= @balance
  end

  def handle_transaction(amount)
    transaction = create_transaction(amount)
    log_transaction(transaction)
  end

  def valid_pin(pin)
    @pin == pin
  end

  def create_transaction(amount)
    @transaction.new(amount, @balance)
  end

  def log_transaction(transaction)
    @log.add_transaction(transaction)
  end
end
