require 'customer'

describe Customer do

  subject(:customer) {described_class.new}

    describe '#initialize' do
      it 'intializes with a balance of 0' do
        expect(customer.balance).to eq 0
      end
    end

    describe '#credit_account' do
      it {is_expected.to respond_to(:credit_account).with(2).arguments }

      it 'will credit balance with amount added' do
        customer.credit_account(10, '10-01-12')
        expect(customer.balance).to eq(10)
      end
    end

    describe '#debit_account' do
      it {is_expected.to respond_to(:debit_account).with(2).arguments }

      it 'will debit balance with amount withdrawn' do
        customer.credit_account(10, '10-01-12')
        customer.debit_account(3, '14-02-12')
        expect(customer.balance).to eq(7)
      end
    end


end
