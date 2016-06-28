class Statement
  def initialize
    @statement = []
  end

  def add_entry(amount, balance)
    @statement << amount
    @statement << balance
  end

  def print
    @statement
  end
end
