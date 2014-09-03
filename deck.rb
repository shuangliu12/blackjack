class Deck
  def initialize
    @cards_used = []
  end

  def all_cards
    values = ['2','3','4','5','6','7','8','9','10','J','K','Q','A']
    suits = ['♦','♣','♥','♠']
    card = []
    suits.each do |value|
      values.each do |suit|
        card << suit+value
      end
    end
   card.shuffle
  end

  def card_draw
    deck = all_cards
    card = deck[0]
    @cards_used << card
    deck = deck.delete(card)

    if @cards_used.length == 52
      return 'The deck is exhausted.'
    end
     card
  end

end
