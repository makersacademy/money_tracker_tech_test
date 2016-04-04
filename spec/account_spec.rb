require 'account'

describe Account do
  subject(:Account) {described_class.new}

    it 'has a default balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'contains an empty array of previous deposits' do
      expect(subject.previous_transactions).to eq []
    end

    # it 'contains an empty hash for the current transaction' do
    #   expect(subject.current_transaction).to eq {}
    # end

    it { is_expected.to respond_to(:accept_deposit).with(1).argument }

    it 'changes the balance after deposits' do
      subject.accept_deposit(2000)
      expect(subject.balance).to eq 2000
    end


    it 'saves the amount and date when a deposit is made' do
      subject.accept_deposit(1000)
      current_time = Time.now.strftime("%d/%m/%Y")
      resulting_hash = {current_time => 1000}
      expect(subject.previous_transactions).to eq [resulting_hash]
    end

    it { is_expected.to respond_to(:accept_withdrawal).with(1).argument }

    it 'changes the balance after withdrawals' do
      subject.accept_withdrawal(500)
      expect(subject.balance).to eq -500
    end

    it 'saves the amount and date when a withdrawal is made' do
      subject.accept_withdrawal(1000)
      current_time = Time.now.strftime("%d/%m/%Y")
      resulting_hash = {current_time => -1000}
      expect(subject.previous_transactions).to eq [resulting_hash]
    end

    it 'saves the current transaction into an array of previous transactions' do
      p subject.accept_deposit(5000)
      p subject.accept_withdrawal(1000)
      current_time = Time.now.strftime("%d/%m/%Y")
      # deposit_hash = {current_time => 5000}
      # withdrawal_hash = {current_time => -1000}
      # previous_trans_array = [deposit_hash, withdrawal_hash]
      expect(subject.previous_transactions).to eq [{Time.now.strftime("%d/%m/%Y") => 5000}, {Time.now.strftime("%d/%m/%Y") => -1000}]
    end
end
