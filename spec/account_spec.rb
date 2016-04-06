require 'account'

describe Account do
  subject(:Account) {described_class.new}

    it 'has a default balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'contains an empty array of previous deposits' do
      expect(subject.previous_transactions).to eq []
    end

    it { is_expected.to respond_to(:accept_deposit).with(1).argument }

    it 'changes the balance after deposits' do
      subject.accept_deposit(2000)
      expect(subject.balance).to eq 2000
    end


    it 'saves the amount and date when a deposit is made' do
      subject.accept_deposit(1000)
      expect(subject.previous_transactions).to eq ["#{Time.now.strftime("%d/%m/%Y")} | 1000 |      | 1000 "]
    end

    it { is_expected.to respond_to(:accept_withdrawal).with(1).argument }

    it 'changes the balance after withdrawals' do
      subject.accept_withdrawal(500)
      expect(subject.balance).to eq -500
    end

    it 'saves the amount and date when a withdrawal is made' do
      subject.accept_withdrawal(1000)
      expect(subject.previous_transactions).to eq ["#{Time.now.strftime("%d/%m/%Y")} |      |  1000 | -1000 "]
    end

    it 'saves the current transaction into an array of previous transactions' do
      subject.accept_deposit(5000)
      subject.accept_withdrawal(1000)
      expect(subject.previous_transactions).to eq ["#{Time.now.strftime("%d/%m/%Y")} | 5000 |      | 5000 ", "#{Time.now.strftime("%d/%m/%Y")} |      |  1000 | 4000 "]
    end
end
