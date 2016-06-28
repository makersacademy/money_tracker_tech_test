class Statement
  def initialize
    @statement = []
  end

  def add_entry(amount, balance)
    @statement.unshift("#{date} || #{amount} || #{balance}\n")
  end

  def print
    "date || transaction || balance\n"
    @statement.join("','")
  end

  private

  def date
    Date.new
  end

end
