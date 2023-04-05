class Interface
  def start
    puts "What's your name?"
    # TODO: do validation
    name = gets.chomp
    @user = User.new(name)
    @diller = User.new('Diller')
    # TODO: CHECK NEW CARD
    @cards = Card.new
    @user_score = Score.new
    @diller_score = Score.new
    start_game
  end

  def start_game
    2.times { @user.add_hand(@cards) }
    2.times { @diller.add_hand(@cards) }
    puts @user.hand
    puts 'You points: '
    @user_score.point(@user.hand)
    puts @user.score = @user_score.score

    # TODO: DELETE?

    @diller_score.point(@diller.hand)
    @diller.score = @diller_score.score

    @user.remove_money
    @diller.remove_money

    user_turn
  end

  def user_turn
    puts '1 - Add card'
    puts '2 - Open hands'
    # puts '3 - skip/end turn'

    case gets.chomp.to_i
    when 1
      @user.add_hand(@cards)
      puts @user.hand
      puts 'You points: '
      @user_score.score = 0

      @user_score.point(@user.hand)
      puts @user.score = @user_score.score
      puts @user_score.score

      diller_turn
    when 2
      diller_turn
    end
  end

  def diller_turn
    unless @diller.score >= 17
      @diller_score.score = 0
      @diller.add_hand(@cards)
      @diller_score.point(@diller.hand)
      # @diller.score = @diller_score.score
    end
    end_game
  end

  def end_game
    puts @user.hand
    puts @user_score.score
    puts '----------------'
    puts @diller.hand
    puts @diller_score.score
    if @user_score.score > @diller_score.score
      puts 'You win'
    else
      puts 'You lose'
    end
  end
end
