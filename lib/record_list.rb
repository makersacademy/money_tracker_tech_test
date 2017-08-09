require_relative 'entry'

class RecordList

  attr_reader :list

  def initialize
    @list = []
  end

  def create_entry(amount, entry = Entry.new(amount))
    add_to_list(entry)
  end

  private

  def add_to_list(entry)
    @list.push(entry)
  end

end
