require_relative 'card.rb'

class Deck
  def initialize
    @cards_used = []
    values = ['2','3','4','5','6','7','8','9','10','J','K','Q','A']
    suits = ['♦','♣','♥','♠']
    deck = []
    suits.each do |suit|
      values.each do |value|
        deck << Card.new(suit,value)
      end
    end
   @deck = deck.shuffle
  end


  def card_draw
    if @cards_used.length == 52
      puts "The deck is exhausted."
      return @cards_used[0]
    else
      card = @deck[0]
      @cards_used << card
      deck = @deck.delete(card)
      return card
    end
  end

end
