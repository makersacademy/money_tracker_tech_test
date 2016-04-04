require_relative "../../lib/Account.rb"

describe Account do

	subject(:account) { described_class.new }
	let(:date) { '04/04/2016' }

	it{is_expected.to respond_to(:print_statement)}
	it{is_expected.to respond_to(:transaction_history)}

	describe '#balance' do 
		it 'returns the current balance' do 
			expect(account.balance).to eq 0
		end
	end

	context 'modifying balance' do

		before { account.deposit(500, date) }

		describe '#deposit' do 

			let(:deposit_history) { {
															date: date,
															credit: 500,
															debit: '||',
															balance: 500	
															} }

			it 'increases balance' do
				expect(account.balance).to eq 500
			end
			it 'adds transaction' do 
				expect(account.transaction_history).to include deposit_history
			end
		end

		describe '#withdraw' do 

			let(:withdrawal_history) { {
															date: date,
															credit: '||',
															debit: 200,
															balance: 300	
															} }

			before { account.withdraw(200, date) }

			it 'reduces balance' do 
				expect(account.balance).to eq 300
			end
			it 'does not allow transactions that would take balance below 0' do 
				expect{account.withdraw(1000, date)}.to raise_error 'Balance too low'
			end
			it 'adds transaction' do 
				expect(account.transaction_history).to include withdrawal_history
			end
		end

	end

end