class Account

attr_reader :statement

STARTBALANCE = 10

  def initialize(args)
    @balance = STARTBALANCE
    @statement = []
    @deposit_class = args[:deposit_class]
  end

  def check_balance
    balance
  end
  
  def deposit(amount)
    new_transaction(amount)
  end

  def withdraw(amount)
    subtract_from_balance(amount)
  end

  private

  def balance
    @balance
  end

  def add_to_balance(amount)
    @balance += amount
  end

  def subtract_from_balance(amount)
    @balance -= amount
  end

  def create_deposit(amount)
    deposit = @deposit_class.new(amount)
    save_to_statement(deposit)
  end

  def new_transaction(amount)
    add_to_balance(amount)
    create_deposit(amount)
  end

  def save_to_statement(object)
    statement <<[object, check_balance]
  end

end