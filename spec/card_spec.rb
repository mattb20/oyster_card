require 'app'
require 'fare'

describe Card do

  subject(:card) { described_class.new }
  subject(:card_money) {described_class.new(5)}

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
    it "deducts 1 from the user everytime they make a journey" do
      card.top_up(10)
      expect(card.send(:deduct)).to eq card.balance
    end
  end

  describe "#touch_in" do

    it "raises an error if they touch in with no money" do
      expect { card.touch_in }.to raise_error "Insufficient funds on card"
    end

    it "changes the status of the journey to be true" do
      card_money.touch_in
      expect(card_money.journey?).to eq true
    end

  end

  describe "#touch_out" do
    it "changes the status of the journey to be false" do
      card.touch_out
      expect(card.journey?).to eq false
    end

    it "reduces the card balance by the minimum fare on touching out" do

      card_money.touch_out
      expect { (card_money.balance).to eq (card_money.balance - Fare::MINIMUM_FARE) }
  end

    it "reduces the card balance by the minimum fare on touching out" do

      expect { card_money.touch_out }. to change{ card_money.balance }.by (-1)
    end
  end

end
