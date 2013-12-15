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
    @bg = Gosu::Image.new(self, 'images/green.png', true)
    @road = Gosu::Image.new(self,'images/road.png', true)
    @sb = Gosu::Image.new(self, 'images/scboard.png', true)
    @ui = Gosu::Font.new(self, 'Monaco', 13)
    @taxi = Taxi.new(self, 250, 425)
  end
  
  def draw
    @bg.draw(0, 0, 0)
    @road.draw(120, 0, 1)
    @road.draw(120, 360, 1)
    @sb.draw(440, 0, 1)
    @taxi.draw
    @ui.draw("Copyright (c) 2013 by zhzhussupovkz", 445, 450, 2)
  end

  def update
    @taxi.move_left if button_down? Gosu::KbLeft
    @taxi.move_right if button_down? Gosu::KbRight
    @taxi.go if button_down? Gosu::KbUp
    @taxi.brake if button_down? Gosu::KbDown
    @taxi.beep if button_down? Gosu::KbSpace
    @taxi.move
  end

  def button_down(key)
    case key
    when Gosu::KbEscape
      close
    end
  end
  
end