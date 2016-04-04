class Account

  attr_accessor :balance
  attr_accessor :transactions

  def initialize
    @balance = 0
    @transactions = [["Date", "Credit", "Debit", "Balance"]]
  end

  def deposit(amount, date)
    @balance += amount
    @transactions.insert(1, ["#{date}", "#{sprintf "%.2f", amount}", " ", "#{sprintf "%.2f", @balance}"])
  end

  def withdraw(amount, date)
    @balance -= amount
    @transactions.insert(1,["#{date}", " ", "#{sprintf "%.2f", amount}", "#{sprintf "%.2f", @balance}"])
  end

  def date
    time = Time.new
    time.strftime("%d/%m/%Y")
  end


end
