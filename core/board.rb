=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Board
class Board

  def initialize window
    @window = window
    @img = Gosu::Image.new(window, 'images/scboard/scboard.png', true)
    @fuel = Gosu::Image.new(window, 'images/scboard/fuel.png', true)
    @money = Gosu::Image.new(window, 'images/scboard/dollar.png', true)
    @damage = Gosu::Image.new(window, 'images/scboard/wrench.png', true)
    @ui = Gosu::Font.new(window, 'Monaco', 13)
  end

  attr_reader :window

  #draw
  def draw
    @img.draw(440, 0, 1)
    @money.draw(495, 50, 2)
    @damage.draw(495, 75, 2)
    @fuel.draw(495, 100, 2)
    time = (Time.at(Time.now.to_i - window.st - 3600*6)).strftime("%H:%M:%S")
    @ui.draw("Time: " + time.to_s, 495, 435, 2)
    @ui.draw("Copyright (c) 2013 by zhzhussupovkz", 445, 450, 2)
    @ui.draw("Icons by http://findicons.com", 460, 465, 2)
  end

end
