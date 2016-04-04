class Statement
  NO_TRANSACTION = 0

  attr_reader :collection

  def initialize
    @collection = [];
  end

  def add_transaction(balance:, deposit: NO_TRANSACTION, withdraw: NO_TRANSACTION)
    @collection << { balance:  currency_format(balance),
                     deposit:  currency_format(deposit),
                     withdraw: currency_format(withdraw),
                     time: date_format
                    }
  end

  def print
    return "No statements available" if @collection.count == 0
    puts "date || credit || debit || balance"
    @collection.each do |statement|
      puts "#{statement[:time]} || #{statement[:deposit]} || #{statement[:withdraw]} || #{statement[:balance]} "
    end
  end


  private

  def currency_format(amount)
    return "" if amount == NO_TRANSACTION
    '%.2f' % amount
  end

  def date_format
    Time.now.strftime('%D')
  end
end
