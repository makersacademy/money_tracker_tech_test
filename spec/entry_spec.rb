require 'entry'

describe Entry do

  let(:payday) { described_class.new(20, "2017-02-02") }
  let(:cinema) { described_class.new(-20, "2017-02-02") }

  describe "#initialize" do
    it 'can save a date to the entry' do
      expect(payday.date.to_s).to include("2017-02-02")
    end

    it 'can categorise amount as a credit' do
      expect(payday.credit).to eq(20)
    end

    it 'can categorise amount as a debit' do
      expect(cinema.debit).to eq(20)
    end
  end

    it "can return the entry date" do
      expect(payday.date.to_s).to include("2017-02-02")
    end

end
