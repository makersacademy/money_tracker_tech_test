
# Understands how to keep track of transaction history

require_relative 'balancer'

class TransactionLog
  def self.instance
    @transaction_log ||= new
  end

  def initialize(balancer: Balancer.new)
    @transactions = []
    @balances = []
    @balancer = balancer
  end

  def log(transaction)
    transactions << transaction
    balances << balancer.update(transaction)
  end

  attr_reader :transactions, :balances

  private

  attr_reader :balancer
end
