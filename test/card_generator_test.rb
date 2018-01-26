require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/guess.rb'
require './lib/round.rb'
require './lib/card_generator.rb'

class CardGeneratorTest < MiniTest::Test
  
  def test_card_generator_accepts_file_as_argument
    generator = CardGenerator.new("cards.txt")
  
    assert_equal "cards.txt", generator.filename
  end

  def test_cards_have_accurate_information
    generator = CardGenerator.new("cards.txt")

    card_1 = Card.new("What is 5 + 5?", "10")
    card_2 = Card.new("What is Rachel's favorite animal?", "red panda")
    card_3 = Card.new("What is Mike's middle name?", "nobody knows")
    card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber")

    deck = Deck.new(generator.generate)

    assert_equal card_1.answer, deck.cards[0].answer
    assert_equal card_2.question, deck.cards[1].question
    assert_equal card_3.answer, deck.cards[2].answer
    refute_equal card_4.question, deck.cards[3].answer

  end

end