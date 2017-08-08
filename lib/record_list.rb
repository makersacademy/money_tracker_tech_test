require_relative 'entry'

class RecordList

  attr_reader :list, :balance

  def create_entry(amount, entry = Entry.new)
    update_balance(amount)
    entry.set_attributes(amount, @balance)
    add_to_list(entry)
  end

  def get_list
    @list
  end

  private

  def add_to_list(entry)
    @list.push(entry)
  end

  def initialize
    @list = []
    @balance = 0
  end

  def update_balance(amount)
    @balance += amount
  end

end
