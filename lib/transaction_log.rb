class TransactionLog

  attr_reader :transactions, :total

  def initialize
    @transactions = []
  end

  def add_new(transaction)
    @transactions << transaction
    calculate_total
  end

  private

    def calculate_total
      @total = 0
      @transactions.each do |transaction|
        @total += transaction.total
      end
    end

end
