class TransactionList

  attr_reader :list

  def add_to_list(transaction)
    @list.push(transaction)
  end

  def get_list
    @list
  end

  private

  def initialize
    @list = []
  end

end
