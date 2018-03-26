require 'app'

describe Card do
  subject(:card) { described_class.new } 
  it "should automatically set the balance to 0" do
    expect(card.balance).to eq 0
  end

  describe "#top_up" do
    it "allows the user to add a given amount to the card" do
      expect(card.top_up(10)).to eq card.balance
    end

    it "raises an error if balance > max (90)" do
      expect { card.top_up(100) }.to raise_error "The maximum you can hold on your card is 90"
    end
  end

  describe "#deduct" do
    it "deducts 2 from the user everytime they make a journey" do
      card.top_up(10)
      expect(card.deduct).to eq card.balance
    end
  end

  describe "#touch_in" do
    it "changes the status of the journey to be true" do
      card.touch_in
      expect(card.journey?).to eq true
    end
  end

  describe "#touch_out" do
    it "changes the status of the journey to be false" do
      card.touch_out
      expect(card.journey?).to eq false
    end
  end
    
end
