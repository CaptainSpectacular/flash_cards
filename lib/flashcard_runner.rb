require './lib/card.rb'
require './lib/deck.rb'
require './lib/guess.rb'
require './lib/round.rb'
require './lib/card_generator.rb'

deck   = Deck.new(CardGenerator.new('./cards.txt').generate)
round  = Round.new(deck)

round.start
