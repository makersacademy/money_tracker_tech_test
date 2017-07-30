require 'transaction'

describe Transaction do
  it "has an initial amount of zero" do
    expect(subject.amount).to eq(0)
  end

  it "has a date" do
    allow(subject).to receive(:date) { "20/09/2016" }
    expect(subject.date).to eq "20/09/2016"
  end

end
