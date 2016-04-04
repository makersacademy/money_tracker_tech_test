require_relative 'todays_date'

class Withdrawal

  def initialize(balance, amount, todays_date: TodaysDate.new.date_of_transaction)
    @todays_date = todays_date
    @balance = balance
    @amount = amount
    @record = {deposit: '', withdrawal: sprintf( "%0.02f", @amount), date: todays_date, balance: @balance}
  end

  def details
    @record.clone
  end

end
