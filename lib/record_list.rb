require_relative 'entry'

class RecordList

  attr_reader :list

  def create_entry(amount, entry = Entry.new)
    entry.set_attributes(amount)
    add_to_list(entry)
  end

  def add_to_list(entry)
    @list.push(entry)
  end
  
  def get_list
    @list
  end

  private


  def initialize
    @list = []
  end

end
