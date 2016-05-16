require 'transaction_log'

DEPOSIT_STRING = '01/01/1970 || 100 ||  || 1100'
WITHDRAW_STRING = '01/01/1970 ||  || 100 || 900'

describe TransactionLog do
  subject(:test_deposit_log) { described_class.new Date.new(1970,1,1), 100, 1100 }
  subject(:test_withdrawal_log) { described_class.new Date.new(1970,1,1), -100, 900 }

  describe '#print' do

    it 'returns a valid string for a deposit' do
      expect(test_deposit_log.print).to eq DEPOSIT_STRING
    end

    it 'returns a valid string for a withdrawal' do
      expect(test_withdrawal_log.print).to eq WITHDRAW_STRING
    end

  end

end
