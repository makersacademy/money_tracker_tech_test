class Account

  attr_reader :balance, :print_statement

  def initialize
    @balance = 0
    @print_statement = 'date || credit || debit || balance'
  end

  def deposit(date, amount)
    @balance = @balance + amount
  end

end
