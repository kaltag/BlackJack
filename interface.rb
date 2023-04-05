class Interface
  def start
    puts "What's your name?"
    # TODO: do validation
    name = gets.chomp
    User.new(name)
    User.new('Diller')
    start_game
  end

  def start_game
    # add 2 cards to user
    # add 2 cards to diller
    # show user points
    # user and diller remove_money
    user_turn
  end

  def user_turn
    puts '1 - Add card'
    puts '2 - Open hands'
    # puts '3 - skip/end turn'
  end

  # TODO: temporary value
  @score = 0

  def diller_turn
    if @score >= 17
      # end turn
    else
      # add card
    end
  end
end
