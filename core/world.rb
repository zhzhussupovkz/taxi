=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#World
class World

  def initialize window
    @window = window
    @bg = Gosu::Image.new(window, 'images/green.png', true)
    @road = Gosu::Image.new(window,'images/road.png', true)
    @sb = Gosu::Image.new(window, 'images/scboard.png', true)
    @ui = Gosu::Font.new(window, 'Monaco', 13)
    @taxi = Taxi.new(window, 250, 425)
  end

  attr_reader :window
  
  #draw
  def draw
    @bg.draw(0, 0, 0)
    @road.draw(120, 0, 1)
    @road.draw(120, 360, 1)
    @sb.draw(440, 0, 1)
    @taxi.draw
    @ui.draw("Copyright (c) 2013 by zhzhussupovkz", 445, 450, 2)
  end

  #update
  def update
    @taxi.move_left if window.button_down? Gosu::KbLeft
    @taxi.move_right if window.button_down? Gosu::KbRight
    @taxi.go if window.button_down? Gosu::KbUp
    @taxi.brake if window.button_down? Gosu::KbDown
    @taxi.beep if window.button_down? Gosu::KbSpace
    @taxi.move
  end
  
end

