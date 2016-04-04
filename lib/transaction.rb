class Transaction

  attr_reader :amount, :type, :date, :start_balance, :end_balance

  def initialize(args)
    @amount = args.fetch(:amount)
    @type = args.fetch(:type)
    @date = args.fetch(:date)
    @start_balance = args.fetch(:start_balance)
    @end_balance = calculate_balance(start_balance, amount)
  end

  private

  def calculate_balance(start_balance, amount)
    deposit? ? start_balance += amount : start_balance -= amount
  end

  def deposit?
    @type == 'deposit'
  end


end
