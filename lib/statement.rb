class Statement

  attr_reader :log, :balance

  def initialize
    @balance = 0
    # @statement = "date || credit || debit || balance"
    @log = []
  end

  def add_transaction(transaction)
    @log.push(transaction)
  end

  # def calculate_balance
  #   @log.each do |transaction|
  #     if transaction.class == Deposit
  #       @balance += transaction.amount
  #     else
  #       @balance -= transaction.amount
  #     end
  #   end
  # end
  #
  # def add_deposits
  #   @deposits.each do |deposit|
  #
  #   end
  #
  # end
end
