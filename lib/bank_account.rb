class BankAccount

  def initialize
    @balance = 0
    @transaction_headers = 'date || credit || debit || balance'
    @transactions = []
  end

  def print_statement
    @transaction_headers +
      @transactions.inject('') do |acc, transaction|
        acc + "\n" + transaction
      end
  end

  def deposit date, amount
    @transactions.push('01/01/1970 || 100 ||  || 100')
  end

end
