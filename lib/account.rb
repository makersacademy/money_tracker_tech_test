class Account

  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(amount)
    @balance += amount
    record_entry(Time.now.strftime("%d/%m/%Y"), amount, balance)
  end

  def withdraw(amount)
    @balance -= amount
    record_entry(Time.now.strftime("%d/%m/%Y"), -amount, balance)
  end

  def print_statement
    puts "date || credit || debit || balance"
    history.each do |entry|
      if entry[1] < 0
        puts "#{entry[0]} || || #{sprintf('%.2f', entry[1].abs)} || #{sprintf('%.2f', entry[2])}"
      else
        puts "#{entry[0]} || #{sprintf('%.2f', entry[1])} || || #{sprintf('%.2f', entry[2])}"
      end
    end
  end

  private

  def record_entry(date, amount, balance)
    entry = []
    entry.push(date, amount, balance)
    history.unshift(entry)
  end

end
