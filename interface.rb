class Interface
  def start
    puts "What's your name?"
    # TODO: do validation
    name = gets.chomp
    @user = User.new(name)
    @diller = User.new('Diller')
    # TODO: CHECK NEW CARD
    @cards = Card.new
    start_game
  end

  def start_game
    @user.add_hand(@cards)
    @diller.add_hand(@cards)
    puts @user.hand
    # show user points

    # TODO: DELETE
    puts '----------------'
    puts @diller.hand

    @user.remove_money
    @diller.remove_money
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
