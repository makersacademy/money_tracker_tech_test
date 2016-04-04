require_relative 'deposit'
require_relative 'withdrawal'
require_relative 'history'

class Account

  def initialize(deposit_klass: Deposit, withdrawal_klass: Withdrawal, history: History.new)
    @deposit_klass = deposit_klass
    @withdrawal_klass = withdrawal_klass
    @balance = 0.00
    @history = history
  end

  def show_balance
    sprintf( "%0.02f", @balance)
  end

  def show_statement
    @history.standard_statement
  end

  def make_deposit(amount)
    deposit_balance(amount)
    @history.receive_entry(@deposit_klass.new(show_balance, amount).details)
  end

  def make_withdrawal(amount)
    withdraw_balance(amount)
    @history.receive_entry(@withdrawal_klass.new(show_balance, amount).details)
  end

  private

    def deposit_balance(amount)
      @balance += amount
    end

    def withdraw_balance(amount)
      @balance -= amount
    end

end
