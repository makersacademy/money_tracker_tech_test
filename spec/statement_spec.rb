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
    expect { statement.print_statement }.to output(
      "Date: #{Date.today} Transaction Type: Deposit Amount: 100 " \
      "Balance: 100\nDate: #{Date.today} Transaction Type: Withdrawl " \
      "Amount: 50 Balance: 50\n"
    ).to_stdout
  end

  it 'can filter just deposits' do
    expect { statement.print_deposits }.to output(
      "Date: #{Date.today} Transaction Type: Deposit Amount: 100 " \
      "Balance: 100\n"
    ).to_stdout
  end

  it 'can filter just withdrawls' do
    expect { statement.print_withdrawls }.to output(
      "Date: #{Date.today} Transaction Type: Withdrawl Amount: 50 " \
      "Balance: 50\n"
    ).to_stdout
  end
end
