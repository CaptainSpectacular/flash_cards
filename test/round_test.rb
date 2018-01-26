require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/guess'
require './lib/round'

class RoundTest < MiniTest::Test
  attr_reader :card_1, :card_2, :deck, :round

  def setup
    @card_1  = Card.new("What is the capital of Alaska?", "Juneau")
    @card_2  = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    @guess   = Guess.new("Juneau", card_1)
    @deck    = Deck.new([card_1, card_2])
    @round   = Round.new(deck)
  end

  def test_round_deck_exists
    assert_equal @deck, @round.deck
  end

  def test_round_guesses_are_empty_by_default
    assert_equal [], @round.guesses
  end

  def test_current_card_is_first_card_by_default
    assert_equal @card_1, @round.current_card
  end

  def test_record_guess
    assert_equal @guess.card, @round.current_card
    assert_equal @guess.response, @round.record_guess("Juneau").response
  end

  def test_guesses_tracks_quantity
    @round.record_guess("Juneau")

    assert_equal 1, @round.guesses.count
  end

  def test_first_guess_feedback
    @round.record_guess("Juneau")

    assert_equal "Correct!", @round.guesses.first.feedback
  end
  
  def test_how_many_correct_guesses
    @round.record_guess("Juneau")

    assert_equal 1, @round.number_correct
  end

  def test_current_card_progresses
    @round.record_guess("Juneau")

    assert_equal @card_2, @round.current_card
  end
  
  def test_guess_count_is_accurate
    @round.record_guess("Juneau")
    @round.record_guess("2")

    assert_equal 2, @round.guesses.count
  end

  def test_feedback_for_wrong_response
    @round.record_guess("Juneau")
    @round.record_guess("2")

    assert_equal "Incorrect.", @round.guesses.last.feedback
  end

  def test_number_correct_does_not_increase_when_wrong
    @round.record_guess("Juneau")
    @round.record_guess("2")

    assert_equal 1, @round.number_correct
  end

  def test_percent_correct
    @round.record_guess("Juneau")
    @round.record_guess("2")

    assert_equal 50, @round.percent_correct
  end

end