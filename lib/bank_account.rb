class BankAccount

  attr_accessor :balance, :transactions

  def initialize(name)
    @name = name
    @balance = 0
    @transactions = []
  end

  def show_statement
    puts "balance"
    puts @balance
  end

end
