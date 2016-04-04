require 'account'

describe 'User can print their account statement' do
  it 'displays transaction type, date and balance for recent transactions' do
    account = Account.new
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)
    expect(account.balance).to eq 2500
    expect(account.statement.count).to eq 3

    expect { account.print_statement }
      .to output(%q(      date ||     credit ||      debit ||    balance
04/04/2016 ||    1000.00 ||            ||    1000.00
04/04/2016 ||    2000.00 ||            ||    3000.00
04/04/2016 ||            ||     500.00 ||    2500.00
)).to_stdout
  end
end
