require "./lib/todays_date.rb"

describe TodaysDate do
  subject(:todays_date) {described_class.new}

  describe "#initialize" do

    it "initializes with a new date saves to the @date variable" do
      expect(todays_date.date_of_transaction).not_to eq nil
    end

    it "formats the date to comply with british standards" do
      expect(todays_date.date_of_transaction).to eq "4/4/2016"
    end

  end

end
