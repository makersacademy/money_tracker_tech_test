require_relative 'deposit'
require_relative 'withdrawal'
require_relative 'statement'


class Account

  attr_reader :balance, :deposits, :withdrawals

  def initialize(statement_klass = Statement, deposit_klass = Deposit, withdrawal_klass = Withdrawal)
    @statement = statement_klass.new
    @deposit = deposit_klass
    @withdrawal = withdrawal_klass
    # @balance = 0
  end

  def deposit(amount, date)
    deposit = @deposit.new(amount, date)
    @statement.add_transaction(deposit)
  end

  def withdrawal(amount, date)
    withdrawal = @withdrawal.new(amount, date)
    @statement.add_transaction(withdrawal)
  end

  def test
    @statement.calculate_balance
  end
end
