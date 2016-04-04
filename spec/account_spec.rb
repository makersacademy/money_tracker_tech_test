require 'account'

describe Account do
  subject(:Account) {described_class.new}

    it 'has a default balance of 0' do
      expect(subject.balance).to eq 0
    end

    it { is_expected.to respond_to(:accept_deposit).with(1).argument }

    it 'changes the balance after deposits' do
      subject.accept_deposit(2000)
      expect(subject.balance).to eq 2000
    end

    it { is_expected.to respond_to(:accept_withdrawal).with(1).argument }

    it 'changes the balance after withdrawals' do
      subject.accept_withdrawal(500)
      expect(subject.balance).to eq -500
    end
end
