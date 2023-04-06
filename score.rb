class Score
  attr_accessor :score

  def initialize
    @score = 0
  end

  def point(hand)
    hand.each do |card|
      score_card = card.gsub(/[+<)^>]/, '')
      if score_card.to_i != 0
        @score += score_card.to_i
      elsif %w[J Q K].include?(score_card)
        @score += 10
      end
    end
    ace_point(hand)
  end

  def ace_point(hand)
    hand.each do |card|
      score_card = card.gsub(/[+<)^>]/, '')
      if score_card == 'A' && @score < 11
        @score += 11
      elsif score_card == 'A' && @score >= 11
        @score += 1
      end
    end
  end
end
