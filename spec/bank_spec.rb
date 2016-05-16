require 'bank_account'

HEADERS = 'date || credit || debit || balance'
DEPOSIT_STRING = '01/01/1970 || 100 ||  || 100'

describe BankAccount do
  let(:test_account) { described_class.new }

  describe '#print_statement' do

    it 'returns a string with the right headers' do
      expect(test_account.print_statement).to include HEADERS
    end

  end

  describe '#deposit' do

    it 'adds a deposit transaction' do
      test_account.deposit Date.new(1970,1,1), 100
      expect(test_account.print_statement).to include DEPOSIT_STRING
    end

  end

end


#statement
#deposit
#withdraw
