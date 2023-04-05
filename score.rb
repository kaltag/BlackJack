class Score
  attr_accessor :score

  def initialize
    @score = 0
  end

  def point(hand)
    hand.each do |card|
      card.gsub!(/[+<)^>]/, '')
      if card.to_i != 0
        @score += card.to_i
      elsif %w[J Q K].include?(card)
        @score += 10
      elsif card == 'A'
        @score += 11
      end
    end
  end
end
