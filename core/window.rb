=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#GameWindow
class GameWindow < Gosu::Window

  def initialize
    super 640, 480, false
    self.caption = 'Taxi Game'
    @world = World.new(self)
  end

  #draw
  def draw
    @world.draw
  end

  #game logic
  def update
    @world.update
  end

  def button_down(key)
    case key
    when Gosu::KbEscape
      close
    end
  end
  
end