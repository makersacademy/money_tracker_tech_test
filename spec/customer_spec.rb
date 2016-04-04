require 'customer'

describe Customer do

  subject(:customer) {described_class.new}

    describe '#initialize' do
      it 'intializes with a balance of 0' do
        expect(customer.balance).to eq 0
      end

      it 'intializes with an empty transaction_history' do
        expect(customer.statement).to eq ([])
      end

      it 'intializes with an empty current_transaction state' do
        expect(customer.current_transaction).to eq ({})
      end
    end

    describe '#credit_account' do
      it {is_expected.to respond_to(:credit_account).with(2).arguments }

      it 'will credit balance with amount added' do
        customer.credit_account(10, '10-01-12')
        expect(customer.balance).to eq(10)
      end

      it 'updates statement' do
        customer.credit_account(10, '10-01-12')
        expect(customer.statement).to eq [{date: '10-01-12', credit: 10, balance: 10}]
      end
    end

    describe '#debit_account' do
      it {is_expected.to respond_to(:debit_account).with(2).arguments }

      it 'will debit balance with amount withdrawn' do
        customer.credit_account(10, '10-01-12')
        customer.debit_account(3, '14-02-12')
        expect(customer.balance).to eq(7)
      end

      it 'updates statement' do
        customer.credit_account(10, '10-01-12')
        customer.debit_account(3, '14-02-12')
        expect(customer.statement).to eq [ {date: '10-01-12', credit: 10, balance: 10},
          {date: '14-02-12', debit: 3, balance: 7} ]
      end
    end

    # describe '#transaction_history' do
    #
    # end

end
