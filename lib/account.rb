class Account
  attr_reader :entries
  attr_reader :balance

  def initialize(entries = [], balance = 2000)
    @entries = entries
    @balance = balance
  end 

  def add_entry(entry)
    @entries << entry
  end

  def statement
     'date || credit || debit || balance'
    @entries.each do |entry|
      puts "#{entry.date} ||" + " ||" + " #{entry.debit} ||" + " #{balance_update(entry)}" if entry.credit.nil?
      puts "#{entry.date} ||" + " #{entry.credit} ||" + " ||" + " #{balance_update(entry)}" if entry.debit.nil?
    end
  end
  
  private

  def balance_update(entry)
    entry.credit.nil? ? @balance -= entry.debit : @balance += entry.credit
  end
end
