class Withdrawal

  attr_reader :date, :amount

  def initialize(amount, date = Time.new)
    @date = parse_date_only(date)
    @amount = -amount
  end

private

  def parse_date_only(date)
    date.strftime("%d/%m/%Y")
  end


end
