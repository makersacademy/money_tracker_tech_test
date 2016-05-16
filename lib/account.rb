class Account

  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def print_statement
    'date || credit || debit || balance'
  end

end
