class Transaction
  attr_reader :date, :total_credit, :total_debit, :total

  def initialize(date = DateTime.now)
    @date = date
    @total_credit = 0
    @total_debit = 0
  end

  def credit(amount)
    @total_credit += amount
    calculate_total
  end

  def debit(amount)
    @total_debit -= amount
    calculate_total
  end

  private

    def calculate_total
      @total = @total_credit + @total_debit
    end
end
