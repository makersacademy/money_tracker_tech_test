require 'bank'

describe Bank do
  let(:statement) {double(:statement)}
  subject(:bank) {described_class.new(statement)}

  before(:example) do
    allow(statement).to receive(:input)
    allow(statement).to receive(:print_out)
  end

  it 'initially has a balance of zero' do
    expect(bank.instance_variable_get(:@balance)).to eq 0
  end

  it 'can deposit money into the account' do
    bank.deposit(100)
    expect(bank.instance_variable_get(:@balance)).to eq 100
  end

  it 'can withdraw moeny from the account' do
    bank.withdraw(100)
    expect(bank.instance_variable_get(:@balance)).to eq -100
  end

  it 'can deliver a statement' do
    bank.request_statement
    expect(statement.print_out)
  end

end
