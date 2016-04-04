require_relative 'deposit'
require_relative 'withdrawal'

class Account

  def initialize(deposit_klass: Deposit, withdrawal_klass: Withdrawal)
    @deposit_klass = deposit_klass
    @withdrawal_klass = withdrawal_klass
    @balance = 0.00
    @history = []
  end

  def show_balance
    sprintf( "%0.02f", @balance)
  end

  def show_statement
    statement = @history.map do |item|
      "#{item[:date]} || #{item[:deposit]} || #{item[:withdrawal]} || #{item[:balance]}"
    end
    statement.unshift("Date || Credit || Debit || Balance")
  end

  def make_deposit(amount)
    deposit_balance(amount)
    @history << @deposit_klass.new(show_balance, amount).details
  end

  def make_withdrawal(amount)
    withdraw_balance(amount)
    @history << @withdrawal_klass.new(show_balance, amount).details
  end


  private

    def deposit_balance(amount)
      @balance += amount
    end

    def withdraw_balance(amount)
      @balance -= amount
    end

end
