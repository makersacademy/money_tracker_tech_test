require 'account'

describe Account do

  describe 'balance' do
    it 'initializes at 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'can increase the balance' do
      expect{ subject.deposit 100 }.to change{ subject.balance }.by 100
    end
  end

  describe '#withdraw' do
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    it 'can decrease the balance' do
      expect{ subject.withdraw 100 }.to change{ subject.balance }.by -100
    end
  end
end
