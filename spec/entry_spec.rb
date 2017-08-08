require 'entry'

describe Entry do

  let(:entry) { described_class.new }

  it 'can save a date to the entry' do
    expect(entry.date.to_s).to include ("2017-08-08")
  end

  it 'can categorise amount as a credit' do
    entry.set_attributes(10, 40)
    expect(entry.credit).to eq(10)
    expect(entry.balance).to eq(40)
  end

  it 'can categorise amount as a debit' do
    second_entry = Entry.new()
    second_entry.set_attributes(-40, 60)
    expect(second_entry.debit).to eq(40)
  end

  it "can return the entry credit" do
    entry.set_attributes(10, 50)
    expect(entry.get_credit).to eq(10)
  end

  it "can return the entry debit" do
    second_entry = Entry.new()
    second_entry.set_attributes(-60, 20)
    expect(second_entry.get_debit).to eq(60)
  end

  it "can return the entry date" do
    expect(entry.get_date.to_s).to include("2017-08-08")
  end
end
