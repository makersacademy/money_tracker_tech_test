
class Transaction

  attr_reader :details

  def initialize
    @details = {}
    @details[:date]=nil
    @details[:deposit]=0
    @details[:withdrawal]=0
    @details[:balance]=0
  end

end
