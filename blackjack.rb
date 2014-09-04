require_relative 'deck.rb'
require_relative 'hand.rb'
require 'pry'

puts 'Welcome to Blackjack!'

$deck = Deck.new

def score(cards_in_hand)
  hand = Hand.new(cards_in_hand)
  current_score = hand.score
end

def player()
  choice = 'h'
  cards_in_hand = []

  card1 =  $deck.card_draw
  cards_in_hand << card1

  puts 'Player was dealt:' + card1.value + card1.suit

  until choice == 's'
    card2 =  $deck.card_draw
    cards_in_hand << card2
    puts 'Player was dealt:' + card2.value + card2.suit

    total_score = score(cards_in_hand)
    puts 'Player score:'+ total_score.to_s

    if total_score == 21
      puts 'You wins!'
      return true
    elsif total_score > 21
      puts 'Bust! You lose...'
      return false
    else
      puts 'Hit or stand (H/S):'
      choice = gets.downcase.chomp
    end
  end
  total_score.to_i
end

def dealer()
  cards_in_hand = []
  total_score = 0
  card1 =  $deck.card_draw
  cards_in_hand << card1
  puts 'Dealer was dealt:' + card1.value + card1.suit

  until total_score >=17
    card2 =  $deck.card_draw
    cards_in_hand << card1
    puts 'Dealer was dealt:' + card2.value + card2.suit
    total_score = score(cards_in_hand)
    puts 'Dealer score:'+ total_score.to_s

    if total_score == 21
      puts 'Dealer wins!'
      return true
    elsif total_score > 21
      puts 'Bust! Dealer lose...'
      return false
    end
  end
  total_score.to_i
end

def win()
  player_score = player()
  if player_score == true || player_score == false
    return
  end
  dealer_score = dealer()
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
