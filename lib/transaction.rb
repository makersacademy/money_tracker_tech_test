
require 'date'

class Transaction

attr_reader :date, :amount, :type

  def initialize(amount:, type:, date: Date.today)
    @date = date
    @amount = amount
    @type = type
  end

  # private
  # def transaction_type_check
  #   @type == 'withdraw' ? @amountChange * -1 : @amountChange
  # end
  #
  # def changeBalance(amountChange)
  #   transaction_type_check
  # end
  #
  # def deposit(amount)
  #   addTransaction(amount)
  # end
  #
  # private
  #
  # def createTransaction(amount)
  #   @transaction = Transaction.new(amount)
  # end
  #
  # def addTransaction(amount)
  #   @history << createTransaction(amount)
  # end
  #
  # def changeBalance
  #   @balance += @transaction.amountChange
  # end

end
