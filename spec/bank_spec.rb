require 'bank'

describe Bank do

  subject(:bank) {described_class.new}

  it 'has an initial balance of zero' do
    expect(bank.balance).to eq Bank::BALANCE
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

  end

  describe "withdraw" do

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

  end

end
