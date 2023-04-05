class User
  attr_reader :money, :name

  def initialize(name)
    @money = 100
    @name = name
  end

  def add_money
    @money += 10
  end

  def remove_money
    @money -= 10
  end
end
