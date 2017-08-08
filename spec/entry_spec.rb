require 'entry'

describe Entry do
  
  let(:entry) { Entry.new('2017-10-10', 500, nil) }
  describe Entry.new('2017-03-03', 100, nil) do
    it { is_expected.to respond_to(:date) } 
    it { is_expected.to respond_to(:credit) }
    it { is_expected.to respond_to(:debit) }
  end

  it 'is initialized with a date' do
    expect(entry.date.to_s).to eq '2017-10-10'
  end
  it 'and either a credit amount or a debit amount' do
    expect { Entry.new('2017-04-04', nil, nil) }.to raise_error("At least one between credit and debit amount must not be nil.")
  end
  it 'but not both' do
    expect { Entry.new('2017-04-04', 200, 600) }.to raise_error("At most one between credit and debit amount can be non-nil.")
  end
  it 'that cannot be negative' do
    expect { Entry.new('2017-05-04', -100, nil) }.to raise_error("Amount cannot be negative.")
  end
end
