require 'customer'

describe Customer do

  subject(:customer) {described_class.new}

    describe '#initialize' do
      it 'intializes with a balance of 0' do
        expect(customer.balance).to eq 0
      end
    end

    describe '#credit_account' do
      it {is_expected.to respond_to(:credit_account).with(1).argument }

      xit 'will credit balance with amount added' do
        customer.credit_account(10)
        expect(balance).to eq(10)
      end
    end


end
