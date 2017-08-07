class Transaction
  attr_reader :date

  def initialize
    @date = DateTime.now.strftime("%d/%m/%Y")
  end
end
