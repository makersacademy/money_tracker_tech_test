class MoneyTracker
  attr_reader :expenditures, :earnings

  def initialize
    @expenditures = []
    @earnings = []
  end
end
