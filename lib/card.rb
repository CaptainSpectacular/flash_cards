class Card
  attr_reader :question, :answer
  
  def initialize(question, answer)
    @answer = answer
    @question = question
  end
end