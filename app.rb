require './lib/account.rb'
require './lib/deposit.rb'
require './lib/statement.rb'
require './lib/transaction.rb'
require './lib/withdrawl.rb'

Shoes.app(width: 1100, height: 800, title: 'Bank Account') do
  background '#F10'..'#F90'
  @account = Account.new

  @title = stack { title("Current Balance: #{@account.current_balance}", align: 'center') }

  stack do

    flow(margin: 15) do
      deposit_amount = edit_line width: 75
      button ' Deposit ' do
        @deposit = Deposit.new(deposit_amount.text.to_f)
        @account.deposit(@deposit)
        @title.clear { title("Current Balance: #{@account.current_balance}", align: 'center') }
        deposit_amount.text = ''
      end
    end

    flow(margin: 15) do
      withdrawl_amount = edit_line width: 75
      button 'Withdrawl' do
        @withdrawl = Withdrawl.new(withdrawl_amount.text.to_f)
        @account.withdraw(@withdrawl)
        @title.clear { title("Current Balance: #{@account.current_balance}", align: 'center') }
        withdrawl_amount.text = ''
      end
    end

    stack(margin: 15) do
      button 'Print Statement' do
        @statement = Statement.new(@account)
        @statement.print_statement.each do |tran|
          stack do
            para tran
          end
        end
      end
    end

    stack(margin: 15) do
      button 'Print Deposits' do
        @statement = Statement.new(@account)
        @statement.print_deposits.each do |tran|
          stack do
            para tran
          end
        end
      end
    end

    stack(margin: 15) do
      button 'Print Withdrawls' do
        @statement = Statement.new(@account)
        @statement.print_withdrawls.each do |tran|
          stack do
            para tran
          end
        end
      end
    end
  end
end
