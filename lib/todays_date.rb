require 'date'

class TodaysDate

  def initialize
    get_date
    format_date
  end

  def date_of_transaction
    @date
  end

  def get_date
    @date = Date.today
  end

  def format_date
    @date = "#{@date.day}/#{@date.month}/#{@date.year}"
  end

end
