require 'bank_account'

HEADERS = 'date || credit || debit || balance'

describe BankAccount do
  let(:test_account) { described_class.new }

  describe '#print_statement' do

    it 'returns a string with the right headers' do
      expect(test_account.print_statement).to include HEADERS
    end

  end

end


#statement
#deposit
#withdraw
