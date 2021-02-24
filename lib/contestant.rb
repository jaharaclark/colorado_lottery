class Contestant
  attr_reader :full_name, :age, :state_of_residence, :game_interests
  attr_accessor :spending_money

  def initialize(person)
    @full_name = person[:first_name] + " " + person[:last_name]
    @age = person[:age]
    @state_of_residence = person[:state_of_residence]
    @spending_money = person[:spending_money]
    @game_interests = []
  end

  def out_of_state?
    @state_of_residence != "CO"
  end

  def add_game_interest(game)
    @game_interests << game
  end
end