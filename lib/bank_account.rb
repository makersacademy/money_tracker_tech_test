class BankAccount

  def initialize transaction_klass
    @balance = 0
    @transaction_headers = 'date || credit || debit || balance'
    @transactions = []
    @transaction_klass = transaction_klass
  end

  def print_statement
    @transaction_headers +
      @transactions.inject('') do |acc, transaction|
        acc + "\n" + transaction
      end
  end

  def deposit date, amount
    update_balance amount
    log_transaction date, amount
  end

  def withdraw date, amount
    update_balance -amount
    log_transaction date, -amount
  end

  private

  def update_balance amount
    @balance += amount
  end

  def log_transaction date, amount
    @transactions.push @transaction_klass.new date, amount, @balance
  end

end
