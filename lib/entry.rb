require 'date'

class Entry

  attr_reader :date, :credit, :debit

  def initialize(date, credit, debit)
    @date, @credit, @debit = Date.parse(date), credit, debit unless !valid?(date, credit, debit)
  end

  def valid?(date, credit, debit)
    if credit.nil? && debit.nil?
      raise ArgumentError.new 'At least one between credit and debit amount must not be nil.' 
    elsif !credit.nil? && !debit.nil?
      raise ArgumentError.new 'At most one between credit and debit amount can be non-nil.' 
    elsif !credit.nil? && credit < 0 || !debit.nil? && debit < 0
      raise ArgumentError.new 'Amount cannot be negative.'
    else
      return true
    end
  end
end
