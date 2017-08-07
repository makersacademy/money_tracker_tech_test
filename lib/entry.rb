require 'date'

class Entry 
  
  attr_reader :date, :credit, :debit

  def initialize(date, credit, debit)
    raise ArgumentError.new "At least one between credit and debit amount must not be nil." if credit.nil? && debit.nil?
    raise ArgumentError.new "At most one between credit and debit amount can be non-nil." if !credit.nil? && !debit.nil?
    raise ArgumentError.new "Amount cannot be negative." if credit != nil && credit < 0 || debit != nil && debit < 0
    @date = Date.parse(date)
    @credit = credit
    @debit = debit
  end 
end 
