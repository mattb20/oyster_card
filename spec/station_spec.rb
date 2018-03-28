require 'station'

describe Station do
  subject(:station) { described_class.new('whitechapel', 1) }
  it "has a zone attribute that can be displayed" do
    expect (station.zone). should eq(1)
  end

end
