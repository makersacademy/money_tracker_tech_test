class Statement

  attr_reader :balance
  
  def initialize(args)
    @balance ||= args[:balance_class].new
    @deposit_class = args[:deposit_class]
    @withdraw_class = args[:withdraw_class]
    @log = []
  end

  def new_transaction(amount)
    create_deposit(amount) if amount>0
    create_withdraw(amount) if amount<0
  end

private

  def create_deposit(amount)
    @balance.add(amount) 
    deposit = @deposit_class.new(amount)
    save_to_statement(deposit)
  end

  def create_withdraw(amount)
    @balance.subtract(amount)
    withdraw = @withdraw_class.new(amount)
    save_to_statement(withdraw)
  end

  def save_to_statement(object)
    @log <<[object, @balance.amount]
  end
end