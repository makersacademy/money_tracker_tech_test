require 'spec_helper'

describe BankAccount do

  subject(:account) { described_class.new("Tester Testerson") }

  it 'should have a balance attribute' do
    expect(account).to respond_to(:balance)
  end

  it 'should be initialized with a balance of 0' do
    expect(account.balance).to eq(0)
  end

  it 'should respond to the #show_statement method' do
    expect(account).to respond_to(:show_statement)
  end

  it 'should initialize with an empty array of transactions' do
    expect(account.transactions).to eq []
  end

end
