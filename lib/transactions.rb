class Transactions

  attr_reader :list

  def initialize
    @list = []
  end

  def store_transaction(amount, balance)
    self.list.push({date: format_date, amount: amount, balance: balance})
  end

  def format_header
    puts "Date || Transaction || Balance"
  end

  def format_statement
    list.each do |item|
      puts "#{item[:date]} || #{item[:amount]} || #{item[:balance]}"
    end
  end

  private

  def format_date
    Date.today.strftime("%m/%d/%Y")
  end
end
