class User
  attr_reader :money, :name, :hand
  attr_accessor :score

  def initialize(name)
    @money = 100
    @name = name
    @hand = []
    @score = 0
  end

  def add_money
    @money += 10
  end

  def remove_money
    @money -= 10
  end

  def add_hand(all_cards)
    @hand << all_cards.cards.sample
    all_cards.cards -= @hand
  end
end
