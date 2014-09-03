
class Hand
  def initialize(cards)
    @cards = cards
   end

  def count_ace(numaces, points)
    if numaces > 0
      space_left = 21 - points
      space_for_rest_of_aces = space_left - (numaces - 1)
      if space_for_rest_of_aces >= 11
        points += 11 + numaces-1
      else
        points += numaces
      end
    end
    return points
  end

  def score
    points = 0
    numaces = 0
    @cards.each do |card|
      if card.include?('Q')||card.include?('J')||card.include?('K')||card.include?('10')
        points += 10
      elsif card.include?("A") == true
        numaces = numaces + 1
      else
        arr = card.split(//)
        points += arr[0].to_i
      end
    end
    points = count_ace(numaces, points)
  end

end
