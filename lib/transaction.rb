class Transaction

attr_reader :time_stamp, :debit, :credit

  def initialize(credit, debit)
    @time_stamp = Time.new.strftime("%d/%m/%Y")
    @credit = credit
    @debit = debit
  end

  def change_balance
    @credit || - @debit
  end
end
