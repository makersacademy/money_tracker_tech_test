require 'date'

class Account

  def initialize
    @balance = 0.00
    @history = []
  end

  def show_balance
    sprintf( "%0.02f", @balance)
  end

  def show_statement
    statement = @history.map do |item|
      "#{item[:date]} || #{item[:deposit]} || #{item[:withdrawal]} || #{item[:balance]}"
    end
    statement.unshift("Date || Credit || Debit || Balance")
  end

  def make_deposit(amount)
    deposit(amount)
    @history << {deposit: sprintf( "%0.02f", amount), withdrawal: '', date: todays_date, balance: show_balance}
  end

  def make_withdrawal(amount)
    withdraw(amount)
    @history << {deposit: '', withdrawal: sprintf( "%0.02f", amount), date: todays_date, balance: show_balance}
  end

  def todays_date
    get_date
    format_date
  end


  private

    def deposit(amount)
      @balance += amount
    end

    def withdraw(amount)
      @balance -= amount
    end

    def format_date
      "#{@date.day}/#{@date.month}/#{@date.year}"
    end

    def get_date
      @date = Date.today
    end

end
