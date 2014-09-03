require_relative 'deck.rb'
# require_relative 'card.rb'
require_relative 'hand.rb'
require 'pry'

puts 'Welcome to Blackjack!'


def per_round(role)
  draw = Deck.new
  card1 =  draw.card_draw
  puts role +' was dealt:' + card1
  return card1
end

def score(cards_in_hand)
  hand = Hand.new(cards_in_hand)
  current_score = hand.score
end

def game_start(role)
  cards_in_hand = []
  card1 = per_round(role)
    cards_in_hand << card1
  choice = 'h'
  until choice == 's'
    card2 = per_round(role)
    cards_in_hand << card2
    total_score = score(cards_in_hand)
    puts role +'score:'+ total_score.to_s


    if total_score == 21
      puts role + 'wins!'
      return true
    elsif total_score > 21
      puts 'Bust! '+role+' lose...'
      return false
    else
      puts 'Hit or stand (H/S):'
      choice = gets.downcase.chomp
      if role == 'dealer'
        if total_score < 17
          puts 'Dealer has to continue until the score hits 17.'
          choice = 'H'
        end
      end
    end

  end
  total_score.to_i
end

def win()
  player_score = game_start('player')
  if player_score == true || player_score == false
    return
  end

  dealer_score = game_start('dealer')
  if dealer_score == true || dealer_score == false
    return
  end

    if player_score > dealer_score
      puts "player wins"
    elsif player_score < dealer_score
      puts 'dealer wins'
    else
      puts 'Game tied!'
    end

end

win()


