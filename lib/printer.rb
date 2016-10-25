class Printer



  def print(account)
    format_time(account.running_balance)
  end

  private

  def format_time(running_balance)
    running_balance.each do |transaction|
      t = Time.parse(transaction[1])
      transaction[1] = t.strftime("%d/%m/%Y")
    end
  end


end
