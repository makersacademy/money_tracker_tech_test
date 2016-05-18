class Account

attr_reader :balance, :transactions

  INITIAL_BALANCE = 0
  STATEMENT_HEADERS = "date || credit || debit || balance"

  def initialize(transaction_klass: Transaction)
    @balance = INITIAL_BALANCE
    @transactions = []
    @transaction_class = transaction_klass
    @statement = STATEMENT_HEADERS
  end

  def deposit(amount)
    @transactions << @transaction_class.new(amount, nil)
  end

  def withdraw(amount)
    @transactions << @transaction_class.new(nil, amount)
  end

  def update_balance(transaction)
    @balance += transaction.change_balance
  end

  def print_statement
    make_statement_string
    @statement
  end

  private

  def make_statement_string
    @transactions.reverse.each do |transaction|
        update_balance(transaction)
        @statement << "\n#{transaction.time_stamp} || #{'%.2f' % transaction.credit} || #{transaction.debit} || #{'%.2f' % @balance}"
    end
  end

end
