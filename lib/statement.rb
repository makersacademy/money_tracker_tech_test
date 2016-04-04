class Statement

  attr_reader :log

  def initialize
    # @statement = "date || credit || debit || balance"
    @log = []
  end

  def add_transaction(transaction)
    @log.push(transaction)
  end

  # def create_statement
  # end
  #
  # def add_deposits
  #   @deposits.each do |deposit|
  #
  #   end
  #
  # end
end
