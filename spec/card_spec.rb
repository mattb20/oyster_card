require 'app'

describe Card do

  subject(:card) { described_class.new }
  subject(:card_money) { described_class.new(Card::MIN_BALANCE) }
  let(:entry_station) { double('station', :name => 'whitechapel') }
  let(:exit_station) { double('station', :name => 'kings cross') }
  let(:journey_current) { double ('journey') }

  context "on initialization" do

  it "should automatically set the card balance to default balance when not passed an argument" do
    expect(card.balance).to eq (Card::DEFAULT_BALANCE)
  end

  it "creates a new journey object" do
    expect(card.journey_current).to be_an_instance_of(Journey)
  end

  it "changes the balance when passed an argument" do
    expect(card_money.balance).to eq (Card::MIN_BALANCE)
  end

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
      expect { card.touch_in(entry_station) }.to raise_error "Insufficient funds on card"
    end

    it "changes the status of the journey to be true" do

      card_money.touch_in()
      expect(card_money.in_journey?).to eq true
    end

    it "will accept the entry station as an argument" do

      expect(card).to respond_to(:touch_in).with(1).argument

    end


  end

  describe "#touch_out" do

    it "reduces the card balance by the minimum fare on touching out" do
      card_money.touch_in(entry_station)
      expect { card_money.touch_out(exit_station) }. to change{ card_money.balance }.by (-Journey::MINIMUM_FARE)
    end


  end

end
