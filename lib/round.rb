class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck         = deck
    @guesses      = []
  end
  
  def current_card
    @deck.cards[@guesses.size]
  end

  def record_guess(guess)
    temp = Guess.new(guess, current_card)
    @guesses << temp
    temp
  end

  def number_correct
    @guesses.select{ |guess| guess.correct? }.size
  end

  def percent_correct
    ((number_correct.to_f / @guesses.size) * 100).round
  end

end