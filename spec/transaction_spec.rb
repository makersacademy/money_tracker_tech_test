require 'transaction'

describe Transaction do 

subject(:transaction) { described_class.new(1000) }

	describe '#initialize' do

		it 'stores date of transaction' do
			time = Time.now
			allow(time).to receive(:strftime).and_return('16/05/2016')
			expect(transaction.date).to eq('16/05/2016')
		end

		it 'with an amount' do
			expect(transaction.amount).to eq 1000
		end
	end
	
end