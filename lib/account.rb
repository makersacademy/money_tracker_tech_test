class Account

  attr_reader :balance, :statement

  def initialize(transaction_klass: Transaction)
    @transaction_class = transaction_klass
    @balance = 0
    @statement = [] 
  end

  def deposit(amount, date)
    @balance += amount
    transaction = @transaction_class.new(date: date, credit: amount, balance: @balance)
    @statement << transaction
  end

  def withdraw(amount, date)
    @balance -= amount
    transaction = @transaction_class.new(date: date, debit: amount, balance: @balance)
    @statement << transaction 
  end

  def print_statement
    puts "date || credit || debit || balance"
    @statement.reverse.each do |item|
    puts item.date.to_s + " || " + item.credit.to_s + " || " + item.debit.to_s + " || " + item.balance.to_s 
      
    end
  end

    

end
