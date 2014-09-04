class Card

  def initialize(suit,value)
    @suit = suit
    @value = value
  end

  def value
    @value
  end

  def suit
    @suit
  end

  def face_card?
    ['J','Q','K'].include?(@value)
  end

  def ace?
    ['A'].include?(@value)
  end

  def other?
    ['2','3','4','5','6','7','8','9','10'].include?(@value)
  end
end
