class Transactions

  attr_reader :list

  def initialize
    @list = []
  end

  def store_transaction(amount, balance)
    self.list.push({date: format_date, amount: amount, balance: balance})
  end

  def format_header
    puts "Date || Credit || Debit || Balance"
  end

  def format_statement
    list.reverse.each do |item|
      format_amount
      puts "#{item[:date]} || #{item[:credit]} || #{item[:debit]} || #{item[:balance]}"
    end
  end

  def format_amount
    list.each do |item|
      if item.has_key?(:debit) || item.has_key?(:credit)
        item
      elsif item[:amount] < 0
        item[:debit] = item.delete :amount
      else
        item[:credit] = item.delete :amount
      end
    end
  end

  private

  def format_date
    Date.today.strftime("%m/%d/%Y")
  end
end
