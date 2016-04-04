class Statements

  def initialize
    @collection = [];
  end

  def create_statement(*transaction)
  end

  def add(balance: balance, credit: 0, debit: 0)
    @collection << {balance: format(balance), credit: format(credit), debit: format(debit)}
  end

  def print
    @collection 
  end

  def format(amount)
    '%.2f' % amount
  end
end