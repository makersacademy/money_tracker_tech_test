require "./lib/transaction_log"

#performs simple calculations based on the account history
class Account

  attr_reader :balance, :history
  STARTING_BALANCE = 0

  def initialize(balance = STARTING_BALANCE, transaction_log = Transaction_Log.new)
    @balance = balance
    @history = transaction_log
  end

  def running_balance
    @arranged = arrange_by_date
    find_balance_for_each_transfer(@arranged)
  end

  private

  def find_balance_for_each_transfer(arranged)
    arranged.each do |transfer|
      transfer.push(@balance + transfer[0])
      @balance += transfer[0]
    end
  end

  def arrange_by_date
    @history.transactions.sort_by {|transfer| transfer[1]}
  end


end
