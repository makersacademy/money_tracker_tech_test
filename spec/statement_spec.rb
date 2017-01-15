require 'spec_helper'

describe Statement do
  let!(:deposit) do
    double('deposit', value: 100,
                      created_date: Date.today.to_s,
                      class: Deposit)
  end

  let!(:withdrawl) do
    double('withdrawl', value: 50,
                        created_date: Date.today.to_s,
                        class: Withdrawl)
  end

  let!(:account) do
    double('account', transaction_record: [[deposit, 100], [withdrawl, 50]])
  end

  let!(:statement) do
    Statement.new(account)
  end

  it 'takes an account on creation' do
    expect(statement.account).to eq(account)
  end

  it 'can output all transactions' do
    expect(statement.print_statement).to eq(
      ["Date: #{Date.today}  Transaction Type: Deposit  Amount: 100 Balance: 100",
       "Date: #{Date.today}  Transaction Type: Withdrawl  Amount: 50 Balance: 50"]
    )
  end

  it 'can filter just deposits' do
    expect(statement.print_deposits).to eq(
      ["Date: #{Date.today}  Transaction Type: Deposit  Amount: 100 Balance: 100"]
    )
  end

  it 'can filter just withdrawls' do
    expect(statement.print_withdrawls).to eq(
      ["Date: #{Date.today}  Transaction Type: Withdrawl  Amount: 50 Balance: 50"]
    )
  end

  it 'can output in date ascending order' do

  end
end
