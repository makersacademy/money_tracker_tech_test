class Transactions

  attr_reader :list

  def initialize
    @list = []
  end

  def store_transaction(date, amount, balance)
    self.list.push({date: date, amount: amount, balance: balance})
  end

  def format_statement
    puts "Date || Transaction || Balance"
    list.each do |item|
      puts "#{item[:date]} || #{item[:amount]} || #{item[:balance]}"
    end
  end
end
