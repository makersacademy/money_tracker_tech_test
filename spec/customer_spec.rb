require 'customer'

describe Customer do

  subject(:customer) {described_class.new}

    describe '#credit_account' do

      it {is_expected.to respond_to(:credit_account).with(1).argument }

      xit 'can credit account with money' do

      end

    end


end
