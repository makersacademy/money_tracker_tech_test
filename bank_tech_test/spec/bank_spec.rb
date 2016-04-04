require 'bank'

describe Bank do
  subject(:bank) {described_class.new}

  describe 'balance' do
    it 'balance starts at 0' do
      expect(bank.account_balance).to eq 0
    end
  end

  describe 'deposit' do
    it 'can be made' do
      bank.make_deposit(100)
      expect(bank.account_balance).to eq(100)
    end
  end

  describe 'withdrawal' do
    it 'can be made' do
      bank.make_deposit(200)
      bank.make_withdrawal(100)
      expect(bank.account_balance).to eq(100)
    end
  end

  describe 'account balance' do
    it 'can be viewed' do
      bank.make_deposit(400)
      bank.make_deposit(100)
      bank.make_withdrawal(35)
      expect(bank.account_balance).to eq(465)
    end

    it 'can be printed' do
      bank.make_deposit(400)
      bank.make_deposit(100)
      bank.make_withdrawal(35)
      expect(bank.print_statement).to eq [{:date => "04/04/2016"}, {:credit => 400}, {:balance => 400}, {:date => "04/04/2016"}, {:credit => 100}, {:balance => 500}, {:date => "04/04/2016"}, {:debit => 35}, {:balance => 465}]
    end
  end

  describe 'date' do
    it 'is attached to statement' do
      bank.make_deposit(400)
      expect(bank.account_statement).to include({:date=>"04/04/2016"})
    end
  end

end
