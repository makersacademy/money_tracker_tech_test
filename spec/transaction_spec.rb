require 'transaction.rb'

describe Transaction do
  subject(:spending) { described_class.new('02/08/2017', -300) }
  subject(:earning) { described_class.new('02/08/2017', 500) }

  describe '#initialize' do
    it 'takes the date from the user' do
      expect(spending.date).to eq '02/08/2017'
    end

    it 'takes the amount from the user' do
      expect(spending.amount).to eq -300
    end

    it 'throws an error if the date is not passed as a string' do
      expect { Transaction.new(11/12/2017, 300) }.to raise_error 'The date must be a string'
    end

    it 'throws an error if the date includes characters' do
      expect { Transaction.new("hello", 300) }.to raise_error 'The date cannot include characters'
    end

    it "throws an error if the date given is not in a valid format" do
      expect { Transaction.new("123/123/2017", 300) }.to raise_error "The date format must be dd/mm/yyyy"
    end

    it 'throws an error if the amount passed is 0' do
      expect { Transaction.new('10/09/2017', 0) }.to raise_error 'The amount cannot be 0'
    end
  end
end
