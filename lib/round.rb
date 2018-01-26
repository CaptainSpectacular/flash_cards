require 'pry'
class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck         = deck
    @guesses      = []
    @feedback     = nil
  end
  
  def current_card
    @deck.cards[@guesses.size]
  end

  def record_guess(guess)
    temp = Guess.new(guess, current_card)
    @guesses << temp
    @feedback = temp.feedback
    temp
  end

  def number_correct
    @guesses.select{ |guess| guess.correct? }.size
  end

  def percent_correct
    ((number_correct.to_f / @guesses.size) * 100).round
  end

  def start
    iteration = 1
    puts "Welcome, You're playing with #{@deck.count} cards."
    puts '--------------------------------------------------'

    until iteration > @deck.count
      puts "This is card number #{@guesses.size + 1}"
      puts current_card.question
      guess = gets.chomp
      record_guess(guess)
      puts @feedback
      iteration += 1
    end
    
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of 4 for a score of #{percent_correct}\%."

  end

end