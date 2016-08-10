class Account

  attr_reader :history

  def initialize
    @history = []
  end

  def balance
    return 0
  end

  def addTransaction(transaction)
    @history << transaction
  end

end
