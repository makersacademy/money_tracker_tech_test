class BankAccount

  attr_accessor :balance, :transactions

  def initialize(name)
    @name = name
    @balance = 0
    @transactions = []
  end

  def show_statement
    puts "date || credit || debit || balance"
    @transactions.each do |transaction|
      if transaction.is_a?(Deposit)
        puts "#{transaction.date} || #{transaction.amount} || ||"
      else
        puts "#{transaction.date} || || #{transaction.amount} ||"
      end
    end
  end

end
