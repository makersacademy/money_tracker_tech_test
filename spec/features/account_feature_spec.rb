require 'spec_helper'

describe 'Banking feature test' do

  dummy_statement = {:type=>:withdraw,
                     :date=>time,
                     :transaction=>20,
                     :balance=>-20},
                    {:type=>:deposit,
                     :date=>time,
                     :transaction=>50,
                     :balance=>30}

  it 'returns correct statement' do
    account = Account.new
    expect(account.instance_eval{balance}).to eq(0)
    account.withdraw_funds(20)
    expect(account.instance_eval{balance}).to eq(-20)
    account.deposit_funds(50)
    expect(account.instance_eval{balance}).to eq(30)

    expect(account.instance_variable_get(:@statement).print_statement).to eq (dummy_statement)
  end

end
