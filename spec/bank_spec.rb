require 'bank'

describe Bank do

  subject(:bank) {described_class.new}
  let(:statement) {double :statement}
  let(:printer) {double :printer}

  it 'has an initial balance of zero' do
    expect(bank.balance).to eq Bank::BALANCE
  end

  it 'has a new statement' do
    expect(bank).to respond_to(:statement)
  end

  describe "#deposit" do

    before do
      bank.deposit(1000, '10-01-2012')
    end

    it 'accepts a deposit amount and date' do
      expect(bank.balance).to eq(1000)
    end

    it 'accepts more than one deposit and correctly updates the balance' do
      bank.deposit(2000, '13-01-2012')
      expect(bank.balance).to eq(3000)
    end

    it 'adds the transaction date and amount to the statement credits' do
      expect(bank.statement.credits).to eq({"10-01-2012" => 1000})
    end

  end


  describe "#withdraw" do

    before do
      bank.deposit(1000, '10-01-2012')
      bank.withdraw(500, '14-01-2012')
    end

    it 'accepts a withdrawal amount and date' do
      expect(bank.balance).to eq(500)
    end

    it 'accepts more than one deposit and correctly updates the balance' do
      bank.withdraw(200, '14-01-2012')
      expect(bank.balance).to eq(300)
    end

    it 'adds the transaction date and amount to the statement debits' do
      expect(bank.statement.debits).to eq({"14-01-2012" => 500})
    end

  end

  describe "#print" do

    before do
      bank.deposit(1000, '10-01-2012')
      bank.withdraw(500, '14-01-2012')
    end

    it 'prints the statement when requested' do
      expect{bank.print_statement}.to output("date || credit || debit || balance\n10-01-2012 || 1000 || ||\n14-01-2012 || || 500 ||\n").to_stdout
    end

  end

end
