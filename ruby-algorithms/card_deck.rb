class CardDeck  
  attr_reader :deck
  def initialize  
    @deck = []
    @ranks = ['2','3','4','5', '6', '7', '8', '9', 'Jack', 'Queen', 'King', 'Ace']
    @suits = ['hearts', 'daimond', 'spade', 'club']
    @suits.each do |suit|
      @ranks.each do |rank|
        @deck << [rank, suit] 
      end
    end
  end

  def shuffle
    @deck = @deck.shuffle
  end

  def sort
    var = 0
    @deck = @deck.sort do |a, b|
      if(@suits.index(a[1]) > @suits.index(b[1]))
        var = 1
      elsif (@suits.index(a[1]) > @suits.index(b[1]))
        var = -1
      else
        if(@ranks.index(a[0]) > @ranks.index(b[0]))
          var = 1
        elsif(@ranks.index(a[0]) < @ranks.index(b[0]))
          var = -1
        else
          var = 0
        end
      end 
    end
  end
end

first = CardDeck.new
# p first.deck
first.shuffle
puts first.deck
first.sort
puts first.deck