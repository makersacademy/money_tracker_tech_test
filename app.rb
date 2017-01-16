require './lib/account.rb'
require './lib/deposit.rb'
require './lib/statement.rb'
require './lib/transaction.rb'
require './lib/withdrawl.rb'

Shoes.app(width: 1100, height: 800, title: 'Bank Account') do
  background '#F10'..'#F90'
  @account = Account.new

  @title = stack { title("Current Balance: #{@account.current_balance}", align: 'center') }

  def new_statement
    @statement = Statement.new(@account)
    return @statement
  end

  def print_statement_method
    window(width: 800, title: 'Full Statement') do
      owner.new_statement.print_statement.each do |tran|
        stack { para tran }
      end
    end
  end

  def print_deposits_method
    window(width: 800, title: 'Deposits Only') do
      owner.new_statement.print_deposits.each do |tran|
        stack { para tran }
      end
    end
  end

  def print_withdrawls_method
    window(width: 800, title: 'Withdrawls Only') do
      owner.new_statement.print_withdrawls.each do |tran|
        stack { para tran }
      end
    end
  end

    flow(margin: 15) do
      deposit_amount = edit_line width: 75
      button ' Deposit ' do
        @deposit = Deposit.new(deposit_amount.text.to_f)
        @account.deposit(@deposit)
        @title.clear { title("Current Balance: #{@account.current_balance}", align: 'center') }
        deposit_amount.text = ''
      end

      withdrawl_amount = edit_line width: 75
      button 'Withdrawl' do
        @withdrawl = Withdrawl.new(withdrawl_amount.text.to_f)
        @account.withdraw(@withdrawl)
        @title.clear { title("Current Balance: #{@account.current_balance}", align: 'center') }
        withdrawl_amount.text = ''
      end
    end

    flow(margin: 15) do

      button 'Print Statement' do
        print_statement_method
      end

      button 'Print Deposits' do
        print_deposits_method
      end

      button 'Print Withdrawls' do
        print_withdrawls_method
      end

    end

end
