require "./lib/deposit.rb"

describe Deposit do
  subject(:deposit) {described_class.new("5.00", 5.00)}

  let(:todays_date_klass) {double(:todays_date_klass)}
  let(:todays_date) {double(:todays_date)}


  before do
    allow(todays_date_klass).to receive(:new).and_return(todays_date)
    allow(todays_date).to receive(:date_of_transaction).and_return("4/4/2016")
  end


  context "when a deposit is made a new instance of Deposit returns the details to be saved in history" do

    describe "#details" do

      it "returns a hash with the relevant values to each key" do
        expect(deposit.details).to eq({deposit:'5.00', withdrawal:'', date:"4/4/2016", balance:"5.00"})
      end

    end

  end
end
