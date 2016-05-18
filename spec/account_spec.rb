require "transaction"
require "account"

describe Account do
  INITIAL_BALANCE = 0
  DEPOSIT_VALUE = 100
  WITHDRAWAL_VALUE = 100
  TODAY = Time.new.strftime("%d/%m/%Y")

  STATEMENT = "date || credit || debit || balance\n#{TODAY} || 100.00 ||  || 100.00"
  let(:deposit_account) {described_class.new}
  let(:transaction_class) {double(:transaction_class, new: transaction)}
  let(:transaction) {double(:transaction, time_stamp: "16/05/2016", credit: DEPOSIT_VALUE, debit: nil, change_balance: +100)}

  let(:withdrawal_account) {described_class.new(transaction_klass: transaction_class_2)}
  let(:transaction_class_2) {double(:transaction_class_2, new: transaction_2)}
  let(:transaction_2) {double(:transaction, credit: nil, debit: WITHDRAWAL_VALUE, change_balance: -100)}


  describe "#initialize" do
    it "initilizes with a balance of zero" do
      expect(deposit_account.balance).to eq(INITIAL_BALANCE)
    end

    it "initializes with an empty transactions array" do
      expect(deposit_account.transactions.empty?).to eq(true)
    end
  end

  describe "#deposit" do
    it "places a transaction in the transactions array" do
      expect{deposit_account.deposit(DEPOSIT_VALUE)}.to change{deposit_account.transactions.length}.by 1
    end
  end

  describe "#withdraw" do
    it "places a transaction in the transactions array" do
      expect{withdrawal_account.withdraw(WITHDRAWAL_VALUE)}.to change{withdrawal_account.transactions.length}.by 1
    end
  end

  describe "#update_balance" do
    it "updates the balance for the current transaction" do
      deposit_account.update_balance(transaction)
      expect(deposit_account.balance).to eq(DEPOSIT_VALUE)
    end
  end

  describe "#print_statement" do
    it "prints the balance in the correct format" do
      deposit_account.deposit(DEPOSIT_VALUE)
      expect(deposit_account.print_statement).to eq(STATEMENT)
    end
  end


end
