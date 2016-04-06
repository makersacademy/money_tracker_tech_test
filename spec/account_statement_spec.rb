# require 'account_statement'
# require 'account'
# describe AccountStatement do
#   subject(:AccountStatement){described_class.new}
#   let(:Account) {double :account}
#
#   it 'initalizes with an empty array of previous transactions' do
#     expect(subject.previous_transactions).to eq []
#   end
#
#   it 'contains a deposit' do
#     account.accept_deposit(5000)
#     expect(subject.previous_transactions).to eq [{Time.now.strftime("%d/%m/%Y") => 5000}]
#   end
#
# end
