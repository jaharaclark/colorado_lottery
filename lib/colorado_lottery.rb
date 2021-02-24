require "Date"

class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants
  
  def initialize
    @registered_contestants = Hash.new {|hash, key| hash[key] = []}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    contestant.game_interests.include?(game.name) && contestant.age >= 18
  end

  def can_register?(contestant, game)
     interested_and_18?(contestant, game) && (game.national_drawing? || !contestant.out_of_state?)
  end

  def register_contestant(contestant, game)
    registered_contestants[game.name] << contestant
  end

  def eligible_contestants(game)
    registered_contestants[game.name].find_all do |contestant|
      contestant.spending_money >= game.cost
    end
  end

  def charge_contestants(game)
    current_contestants[game] = []
    eligible_players = eligible_contestants(game)
    eligible_players.map do |player|
      player.spending_money -= game.cost
      current_contestants[game] << player.full_name
    end
    current_contestants
  end

  def draw_winners
  #   Date.today.strftime("%Y-%m-%d")
  #   require 'pry'; binding.pry
  #   Iterate over the current_contestants hash
  #   Need to pick a random winner (HOW!?!?!)
  #   That winner needs to go in the winners array which is an array of hashes.

  # when you iterate over a hash and you're using a each you need to pass both the key and the value

  #   current contestants.each do |game, contestants|
  #     use this informaiton to create a new hash game will be the new key and the value will be contestants.sample
  end
end