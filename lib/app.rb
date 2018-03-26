require_relative 'card'
require_relative 'fare'
require_relative 'station'


card = Card.new
card.top_up(66)
card.balance
card.top_up(22)
card.balance
card.deduct
card.balance