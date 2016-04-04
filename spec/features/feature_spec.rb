require './lib/account'
require './lib/interface'

describe 'Sample usage case scenario' do
  before do
    account = Account.new
    interface = Interface.new
  end

  it 'works as expected on the following usage scenario' do
    account = Account.new
    interface = Interface.new
    account.deposit(1000, '10/01/2012')
    account.deposit(2000, '13/01/2012')
    account.withdrawal(500, '14/01/2012')
    expect(interface.print(account)).to eq (
      "date || credit || debit || balance\n" \
      "14/01/2012 || || 500 || 2500\n" \
      "13/01/2012 || 2000 || || 3000\n" \
      "10/01/2012 || 1000 || || 1000" \
      )

    expect(interface.print(account, 'deposits', 'asc')).to eq (
      "date || credit || debit || balance\n" \
      "10/01/2012 || 1000 || || 1000\n" \
      "13/01/2012 || 2000 || || 3000" \
      )
  end
end
