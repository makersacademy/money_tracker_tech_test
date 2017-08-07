
describe Account do

  let(:statement) { double("Statement") }
  let(:transactions) { double("Transactions") }
  subject(:account) { described_class.new(statement, transactions) }

  describe "attributes" do
    context "balance" do
      it "will be set to zero" do
        expect(account.balance).to eq(Account::INITIAL_BALANCE)
      end
    end
  end

end
