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
      @amount.positive? ? @amount.to_s : '',
      @amount.negative? ? @amount.abs.to_s : '',
      @balance.to_s
    ]
  end

  def format_date date
    date.strftime '%d/%m/%Y'
  end

end
