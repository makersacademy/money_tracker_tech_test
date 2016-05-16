class BankAccount

  def initialize transaction_klass
    @current_balance = 0
    @transaction_headers = 'date || credit || debit || balance'
    @transactions = []
    @transaction_klass = transaction_klass
  end

  def print_statement
    @transaction_headers + '\n' +
      @transactions.reverse.join('\n')
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
    @current_balance += amount
  end

  def log_transaction date, amount
    @transactions.push @transaction_klass.new date, amount, @current_balance
  end


end
