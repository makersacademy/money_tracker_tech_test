require 'transaction'

describe Transaction do 

subject(:transaction) { described_class.new }

	describe '#initialize' do

		it 'stores date of transaction' do
			time = Time.now
			allow(time).to receive(:strftime).and_return('16/05/2016')
			expect(transaction.date).to eq('16/05/2016')
		end

		it 'has a credit amount' do
			expect(transaction.credit).to eq 0
		end

		it 'with a debit amount' do
			expect(transaction.debit).to eq 0
		end
	end

	describe '#type_credit' do

		it 'assigns an amount to credit attribute' do
			transaction.type_credit(1000)
			expect(transaction.credit).to eq 1000
		end

	end

	describe '#type_debit' do

		it 'assigns an amount to debit attribute' do
			transaction.type_debit(1000)
			expect(transaction.debit).to eq 1000
		end

	end
	
end