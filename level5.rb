class Player
  def play_turn(warrior)

    def captive_action(warrior)
      if warrior.feel.captive?
        warrior.rescue!
      else
        warrior.attack!
      end
    end

    if @health.nil? || (warrior.feel.empty? && warrior.health >= 20)
      warrior.walk!
    elsif (warrior.health < @health) && warrior.feel.empty?
      warrior.walk!
    elsif (warrior.health < @health)
      captive_action(warrior)
    elsif warrior.feel.empty? && warrior.health < 20
      warrior.rest!
    else
      captive_action(warrior)
    end

    @health = warrior.health
  end
end
