class Account

  attr_accessor :balance, :transaction, :credit, :debit, :credit_amount, :credit_date, :debit_amount, :debit_date

  def initialize
    @balance = 0
    @transaction = []
  end

  def credit(credit_amount, credit_date)
    new_balance = @balance += credit_amount
    @transaction << [credit_date, credit_amount, new_balance]
  end

  def debit(debit_amount, debit_date)
    new_balance = @balance -= debit_amount
    @transaction << [debit_date, debit_amount, new_balance]
  end

end
