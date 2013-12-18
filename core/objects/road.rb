=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Road
class Road

  def initialize window, x, y
    @window = window
    @x, @y = x, y
    @img = Gosu::Image.new(window, "images/env/road.png", false)
  end

  #draw
  def draw
    @img.draw(@x, @y, 1)
  end

  #move
  def move
    @y += 3.0
    @y = 0 if @y >= 480
  end

end

