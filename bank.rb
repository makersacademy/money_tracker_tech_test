class Bank

  attr_reader :statement, :balance

  def initialize(balance=0)
    @balance = balance
    @statement = []
  end

  def deposit(amount, date=Time.now)
    @balance += amount
    @statement.push({date:date, credit:amount, balance:balance})
  end
  
  def withdraw(amount, date=Time.now)
    @balance -= amount
    @statement.push({date:date, debit:amount, balance:balance})
  end

  def print_statement
    puts "date || credit || debit || balance"
    @statement.each do |transaction|
      transaction.each { |key,value| puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"}
    end
  end
end