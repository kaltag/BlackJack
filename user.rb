class User
  attr_reader :money, :name, :hand

  def initialize(name)
    @money = 100
    @name = name
    @hand = []
  end

  def add_money
    @money += 10
  end

  def remove_money
    @money -= 10
  end

  def add_hand(all_cards)
    @hand = all_cards.cards.sample(2)
    all_cards.cards -= @hand
  end
end
