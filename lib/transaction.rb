class Transaction

attr_reader :date

  def initialize(amount, client, type)
    @amount = amount
    @client = client
    @type = type
    @date = Time.now
  end

end
