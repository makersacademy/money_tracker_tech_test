class Tracker 
  
  attr_reader :initial_balance, :account

  def initialize(account = Account.new([]), initial_balance = 0)
    @account = account
    @initial_balance = initial_balance
  end 

  def calculate_balance(account, entry)
    current_balance = @initial_balance
    index = account.get_entry_index(entry)
    (index + 1).times{ |k| current_balance += account.entries[k].net_amount }  
    current_balance
  end

  def get_current_balance(account, entry)
    return calculate_balance(account, entry)
  end
end
