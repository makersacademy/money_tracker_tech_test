class BankAccount

  attr_accessor :balance, :transactions

  def initialize(name)
    @name = name
    @balance = 0
    @transactions = []
  end

  def show_statement
    show_headers
    @transactions.each do |trans|
      if deposit(trans)
        show_deposit(trans)
      else
        show_withdrawal(trans)
      end
    end
  end

  private

  def show_headers
    puts "date || credit || debit || balance"
  end

  def deposit(trans)
    trans.is_a?(Deposit)
  end

  def show_deposit(trans)
    puts "#{trans.date} || #{trans.amount} || || #{trans.balance}"
  end

  def show_withdrawal(trans)
    puts "#{trans.date} || || #{trans.amount} || #{trans.balance}"
  end

end
