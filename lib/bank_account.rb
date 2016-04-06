class BankAccount

  attr_accessor :balance

  def initialize(name)
    @name = name
    @balance = 0
  end

  def show_statement
    puts "balance"
    puts @balance
  end

end
