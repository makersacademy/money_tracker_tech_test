#records all new transactions
class Transaction_Log

  attr_accessor :transactions

  def initialize
    @transactions = []
  end

  def new_transaction(amount, date = Time.now)
    @amount = amount
    @date = date.to_s
    save_transaction(@amount, @date)
  end

  private

  def save_transaction(amount, date)
    @transactions << {"amount" => amount, "date" => date}
  end


end
