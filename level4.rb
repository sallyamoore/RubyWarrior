class Player
  def play_turn(warrior)

    if @health.nil? || (warrior.feel.empty? && warrior.health >= 20)
      warrior.walk!
    elsif (warrior.health < @health) && warrior.feel.empty?
      warrior.walk!
    elsif (warrior.health < @health)
        warrior.attack!
    elsif warrior.feel.empty? && warrior.health < 20
        warrior.rest!
    else
      warrior.attack!
    end

    @health = warrior.health
  end
end
