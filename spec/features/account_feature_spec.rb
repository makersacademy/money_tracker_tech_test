describe 'Banking feature test' do

  dummy_statement = {:type=>:withdraw,
                     :date=>"04/04/2016",
                     :transaction=>20,
                     :balance=>-20},
                    {:type=>:deposit,
                     :date=>"04/04/2016",
                     :transaction=>50,
                     :balance=>30}

  it 'returns correct statement' do
    account = Account.new
    expect(account.balance).to eq(0)
    account.withdraw_funds(20)
    expect(account.balance).to eq(-20)
    account.deposit_funds(50)
    expect(account.balance).to eq(30)

    expect(account.print_statement).to eq (dummy_statement)
  end

end
