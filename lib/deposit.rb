require_relative 'todays_date'

class Deposit

  def initialize(balance, amount, todays_date: TodaysDate.new.date_of_transaction)
    @todays_date = todays_date
    @record = {deposit: sprintf( "%0.02f", amount), withdrawal: '', date: @todays_date, balance: balance}
  end

  def details
    @record.clone
  end

end
