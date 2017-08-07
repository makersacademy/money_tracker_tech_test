
describe Account do

  let(:transactions) { double("Transactions") }
  subject(:account) { described_class.new(transactions) }

  let(:large_sum) { 1000 }

  describe "attributes" do
    context "balance" do
      it "will be set to zero" do
        expect(account.balance).to eq(Account::INITIAL_BALANCE)
      end
    end
  end

  describe "deposit" do
    it "will increase the account balance by the arg's value" do
      expect{account.deposit(large_sum)}.to change{account.balance}.from(Account::INITIAL_BALANCE).to(large_sum)
    end
  end

  describe "withdraw" do
    context "when withdrawl sum is smaller or equal to balance" do
      it "will decrease the account balance by the arg's value" do
        account.deposit(large_sum)
        expect{account.withdraw(large_sum)}.to change{account.balance}.from(large_sum).to(Account::INITIAL_BALANCE)
      end
    end
    context "when withdrawl sum exceeds balance" do
      it "will stop withdrawl" do
        expect{account.withdraw(large_sum)}.to raise_error("You don't have enough to withdraw")
      end
    end
  end

  # # describe "print_statement" do
  # #   before do
  # #     allow(statement).to receive(:new).with(transactions)
  # #     allow(statement).to receive(:print_it)
  # #   end
  # #   it "instantiates a new statement" do
  # #     expect(statement).to receive(:new).with(transactions)
  # #     account.print_statement
  #   end
  #   # it "prints new statement" do
  #   #   expect(statement).to receive(:print_it)
  #   #   account.print_statement
  #   # end
  # end

end
