require 'spec_helper'
require 'account'

describe Account do
  
  DEPOSIT_AMOUNT1 = 1000
  WITHDRAWAL_AMOUNT1 = 500
  DATE1 = Date.new(2012,1,10)
  DATE2 = Date.new(2012,1,13)
  subject(:account) { described_class.new }
  let(:transaction_class) { double :transaction_class }

  describe '#deposit' do 
    it 'will add the balance passed to deposit to the balance' do
      account.deposit(amount: DEPOSIT_AMOUNT1, date: DATE1)
      expect(account.balance).to eq DEPOSIT_AMOUNT1
    end

    it 'will create a transaction object' do
      allow(transaction_class).to receive(:new).with(date: DATE1, credit: DEPOSIT_AMOUNT1, balance: DEPOSIT_AMOUNT1)
      account.deposit(amount: DEPOSIT_AMOUNT1, date: DATE1)
      expect(transaction_class).to receive(:new).with(date: DATE1, credit: DEPOSIT_AMOUNT1, balance: DEPOSIT_AMOUNT1)
      account.deposit(amount: DEPOSIT_AMOUNT1, date: DATE1)
    end

    it 'will add the transaction  to the statement' do
      account.deposit(amount: DEPOSIT_AMOUNT1, date: DATE1)
      expect(account.statement.length).to eq 1
    end
  end

  describe '#withdraw' do
    it 'will deduct the balance passed to deposit from the balance' do
      account.deposit(amount: DEPOSIT_AMOUNT1, date: DATE1)
      account.withdraw(amount: WITHDRAWAL_AMOUNT1, date:DATE2)
      expect(account.balance).to eq DEPOSIT_AMOUNT1 - WITHDRAWAL_AMOUNT1
    end

    it 'will add the transaction to the statement' do
      account.withdraw(amount: WITHDRAWAL_AMOUNT1, date:DATE2)
      expect(account.statement.length).to eq 1
    end
  end

  describe '#balance' do
    it 'will initialize with a balance of 0' do
      expect(account.balance).to eq 0
    end
  end

  describe '#statement' do
    it 'will intitialize with an empty statement' do
      expect(account.statement).to eq []
    end
  end

  describe '#print_statement' do
    it 'will print to the screen' do
      account.deposit(amount: DEPOSIT_AMOUNT1, date: DATE1)
      account.withdraw(amount: WITHDRAWAL_AMOUNT1, date: DATE2)
      expect { account.print_statement }.to output.to_stdout
    end
  end
end

