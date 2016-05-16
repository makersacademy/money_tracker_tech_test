class Transaction

  attr_reader :date, :amount, :balance_at_transaction

  def initialize(amount, date = Time.new)
    @date = parse_date_only(date)
    @amount = amount
    # @balance_at_transaction = calculate_balance(amount, current_balance)
  end

private

  def calculate_balance(amount, current_balance)
    p "CB #{current_balance}"
    current_balance + amount
  end

  def parse_date_only(date)
    date.strftime("%d/%m/%Y")
  end

end
