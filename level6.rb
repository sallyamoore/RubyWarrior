class Player
  def play_turn(warrior)

    def captive_action(warrior)
      if warrior.feel.captive?
        warrior.rescue!
      elsif warrior.feel(:backward).captive?
        warrior.rescue!(:backward)
      else
        warrior.attack!
      end
    end

    # area not empty
    if warrior.feel(:backward).wall?
      warrior.walk!
    elsif warrior.feel(:backward).captive?
      captive_action(warrior)
    elsif !warrior.feel.empty?
      captive_action(warrior)

    # taking damage from arrows
    elsif warrior.feel.empty?
      if @health.nil?
        warrior.walk!(:backward)
      elsif warrior.health >= 20
        warrior.walk!
      elsif warrior.health >= @health && warrior.health < 20
        warrior.rest!
      elsif warrior.health < @health && warrior.health < 9
        warrior.walk!(:backward)
      else
        warrior.walk!
      end
    end

    @health = warrior.health
  end
end
