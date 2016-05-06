class Statement
  def initialize
    @account_statement = []
  end

  def print_statement
    puts "type || date || debit || balance\n"

    account_statement.each do | e |
      e.each_with_index do | value, index |
        if index == (e.length) -1
          puts value[1].to_s
        else
          print value[1].to_s + " || "
        end
      end
    end
  end

  def calculate_statement(amount, type, balance)
    statement = {}

    statement[:type] = type
    statement[:date] = time
    statement[:transaction] = amount
    statement[:balance] = balance

    account_statement.push(statement)
  end


  private

  attr_accessor :account_statement

  def time
    Time.now.strftime("%m/%d/%Y")
  end

end
