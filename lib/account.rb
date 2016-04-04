require_relative 'deposit'
require_relative 'withdrawal'
require_relative 'statement'


class Account

  attr_reader :balance, :deposits, :withdrawals

  def initialize(statement_klass = Statement)
    @statement = statement_klass.new
    @balance = 0
    # @deposits = []
    # @withdrawals = []
  end

  def deposit(amount, date)
    deposit = Deposit.new(amount, date)
    @statement.add_transaction(deposit)
  end
  #
  # def withdrawal(amount, date)
  #   withdrawal = Withdrawal.new(amount, date)
  #   # @statement.add_withdrawal(withdrawal)
  # end
end
