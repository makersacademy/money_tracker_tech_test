require 'transaction'

describe Transaction do

  # Converts to string to avoid miliseconds issue
  DATE = DateTime.now.to_s

  describe '#initialize' do
    it 'is assigned today\'s date' do
      expect(subject.date.to_s).to eq DATE
    end

    it 'has a credit amount of 0' do
      expect(subject.total_credit).to eq 0
    end

    it 'has a debit amount of 0' do
      expect(subject.total_debit).to eq 0
    end
  end

  describe '#credit' do
    it { is_expected.to respond_to(:credit).with(1).argument }

    it 'can increase the total credit amount' do
      expect{ subject.credit 100 }.to change{ subject.total_credit }.by 100
    end
  end

  describe '#debit' do
    it { is_expected.to respond_to(:debit).with(1).argument }

    it 'can decrease the total debit amount' do
      expect{ subject.debit 100 }.to change{ subject.total_debit }.by -100
    end
  end

  describe '#calculate_total' do
    it 'calculates difference between credit_total and debit_total' do
      subject.credit 100
      subject.debit 200
      expect(subject.total).to eq -100
    end
  end
end
