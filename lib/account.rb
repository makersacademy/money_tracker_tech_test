class Account
  attr_reader :entries

  def initialize(entries = [])
    @entries = entries
  end

  def add_entry(entry)
    @entries << entry
  end
  
  def get_entry_index(entry)
    return @entries.index(entry)
  end
end
