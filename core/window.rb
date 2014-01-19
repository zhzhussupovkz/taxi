=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#GameWindow
class GameWindow < Gosu::Window

  include Singleton

  def initialize
    super 640, 480, false
    self.caption = 'Taxi Game'
    begin
      @menu = Menu.new(self)
      @world = World.new(self)
      @st = Time.now.to_i
      @pause = true
      @world.start
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :st, :world
  attr_accessor :pause

  #draw
  def draw
    @menu.draw
    @world.draw if @menu.display === false
  end

  #game logic
  def update
    @menu.update if pause
    @world.update if not pause
  end

  #button down event
  def button_down(key)
    case key
    when Gosu::KbEscape
      close
    when Gosu::KbP
      @pause = !@pause
    end
  end
  
end