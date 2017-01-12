require 'spec_helper'

describe Statement do
  let!(:deposit) do
    double('deposit', value: 100,
                      created_date: Date.today.to_s)
  end

  let!(:withdrawl) do
    double('withdrawl', value: 50,
                        created_date: Date.today.to_s)
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

  it 'can output transactions' do
    expect { statement.print_statement }.to output(
      'Date: 2017-01-12 Transaction Type: RSpec::Mocks::Double Amount: 100 ' \
      "Balance: 100\nDate: 2017-01-12 Transaction Type: RSpec::Mocks::Double " \
      "Amount: 50 Balance: 50\n"
    ).to_stdout
  end
end
