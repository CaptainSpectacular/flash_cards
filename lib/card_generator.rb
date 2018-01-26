
class CardGenerator
  attr_reader :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def generate
    @cards = File.read(filename)
                 .scan(/(.*,)(.*\n)/)
                 .map{ |card| card = Card.new(card[0], card[1]) }
                 .each{ |card| card.answer.gsub!("\n", "") }
                 .each{ |card| card.question.gsub!(",", "") }
  
  end

end