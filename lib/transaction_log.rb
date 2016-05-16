class TransactionLog
  HEADERS = 'date || credit || debit || balance'

  def self.headers
    HEADERS
  end

  def initialize date, amount, balance
    @date = date
    @amount = amount
    @balance = balance
  end

  def to_s separator = ' || '
    data_array.join separator
  end

  private

  def data_array
    [
      format_date(@date),
      @amount.positive? ? format_value(@amount) : '',
      @amount.negative? ? format_value(@amount) : '',
      format_value(@balance)
    ]
  end

  def format_value amount
    '%.2f' % amount.abs
  end

  def format_date date
    date.strftime '%d/%m/%Y'
  end

end
