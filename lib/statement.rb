class Statements

  def initialize
    @collection = [];
  end

  def create_statement(balance: balance, deposit: 0, withdraw: 0)
    statement = {}
    statement.store(:time, date_format)
    statement.store(:balance, currency_format(balance))
    @collection << statement
  end


  def print
    @collection 
  end

  private

  def currency_format(amount)
    '%.2f' % amount
  end

  def date_format
    Time.now.strftime('%D')
  end
end