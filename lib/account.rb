require_relative 'transaction'

class Account

  attr_reader :balance, :statement

  def initialize(transaction_klass = Transaction)
    @balance = 0
    @statement = []
    @transaction_klass = transaction_klass
  end

  def credit(amount: amt, date: dt)
    @balance += amount
    transaction = @transaction_klass.new(date: date, credit: amount, balance: @balance)
    @statement << transaction
  end

  def debit(amount: amt, date: dt)
    @balance -= amount
    transaction = @transaction_klass.new(date: date, debit: amount, balance: @balance)
    @statement << transaction
  end

  def print_statement
    p "date || credit || debit || balance"
    create_statement
  end

  def print_credits
    p "date || credit || debit || balance"
    credit_statement
  end

  def print_debits
    p "date || credit || debit || balance"
    debit_statement
  end

  private

  def sort_transactions(array)
    array.sort_by { |transaction| transaction.date }.reverse
  end

  def create_statement
    sort_transactions(@statement).map do |transaction|
      transaction.credit == nil ? credit = '' : credit = ('%.2f' % transaction.credit)
      transaction.debit == nil ? debit = '' : debit = ('%.2f' % transaction.debit)
      p "#{transaction.date} || #{credit} || #{debit} || #{'%.2f' % transaction.balance}"
    end
  end

  def credit_statement
    sort_transactions(@statement).map do |transaction|
      if transaction.credit != nil
        p "#{transaction.date} || #{transaction.credit} || #{'%.2f' % transaction.balance}"
      end
    end
  end

  def debit_statement
    sort_transactions(@statement).map do |transaction|
      if transaction.debit != nil
        p "#{transaction.date} || #{transaction.debit} || #{'%.2f' % transaction.balance}"
      end
    end
  end

end
