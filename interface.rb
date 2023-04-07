class Interface
  USER_TURN_METHOD = { 1 => :add_card, 2 => :open_hands, 3 => :skip_turn }.freeze

  def start
    puts "What's your name?"
    name = gets.chomp
    @user = User.new(name)
    @diller = User.new('Diller')
    start_game
  end

  def init
    @cards = Card.new
    @user_score = Score.new
    @diller_score = Score.new
    @user.hand = []
    @diller.hand = []
  end

  def start_game
    init
    2.times { @user.add_hand(@cards) }
    2.times { @diller.add_hand(@cards) }
    puts "Your money: #{@user.money}"
    puts "You cards: #{@user.hand.join(' ')}"
    @user_score.point(@user.hand)
    puts "You points: #{@user_score.score}"

    @user.remove_money
    @diller.remove_money
    @user_can_play = 0
    @skipe_hide = 0
    user_turn
  end

  def user_turn
    @diller.hand.count == 3 ? (puts 'Diller *** cards') : (puts 'Diller ** cards')
    puts '1 - Add card'
    puts '2 - Open hands'
    puts '3 - Skip' if @skipe_hide.zero?

    key = gets.to_i
    send(USER_TURN_METHOD[key]) if USER_TURN_METHOD[key]
  end

  def add_card
    @user.add_hand(@cards)
    @user_score.score = 0
    @user_score.point(@user.hand)
    @user_can_play += 1
    @user_can_play < 2 ? diller_turn : show_score
  end

  def open_hands
    @user_can_play += 1
    @user_can_play < 2 ? diller_turn : show_score
  end

  def skip_turn
    @skipe_hide = 1
    @user_can_play < 1 ? diller_turn : show_score
  end

  def user_can_play?
    if @user_can_play == 1
      show_score
    else
      @user_can_play += 1
      user_turn
    end
  end

  def diller_turn
    @diller_score.point(@diller.hand)
    if @diller_score.score <= 17 && @user_score.score < 21
      @diller_score.score = 0
      @diller.add_hand(@cards)
      @diller_score.point(@diller.hand)
    end

    user_can_play?
  end

  def show_score
    puts "You cards: #{@user.hand.join(' ')}"
    puts "You points: #{@user_score.score}"
    puts '--------------------------'
    puts "Diller cards: #{@diller.hand.join(' ')}"
    puts "Diller points: #{@diller_score.score}"

    end_game
    start_new_game?
  end

  def end_game
    if @diller_score.score > 21 && @user_score.score > 21
      puts 'Both lose'
    elsif @user_score.score == @diller_score.score
      puts 'Less'
      @user.add_money
      @diller.add_money
    elsif (@user_score.score < 22 && @user_score.score > @diller_score.score) || @diller_score.score > 21
      puts 'You win'
      2.times { @user.add_money }
    else
      puts 'You lose'
      2.times { @diller.add_money }
    end
  end

  def start_new_game?
    puts '1 - Start new game'
    puts '2 - Exit'
    case gets.to_i
    when 1
      new_game
    when 2
      exit
    end
  end

  def new_game
    if @user.money || @diller.money.positive?
      puts '========================='
      puts 'Start new game!'
      system 'clear'
      start_game
    else
      puts 'Game over'
      exit
    end
  end
end
