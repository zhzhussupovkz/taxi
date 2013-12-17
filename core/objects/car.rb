=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Car
class Car

  def initialize window, x, y, img
    @window, @x, @y = window, x, y
    @img = Gosu::Image.new(window, img, false)
  end
  
  attr_accessor :x, :y
  attr_reader :window

  #move left
  def move_left
    @x -= 2.5
    @x = 135.0 if @x <= 135.0
  end

  #move right
  def move_right
    @x += 2.5 if @x <= 280.0
  end

  #accelerate
  def go
    @y -= 5.0 if @y >= 200.0
  end

  #brake
  def brake
    @y += 2.0 if @y <= 450.0
  end

  #move
  def move
    @x %= 640
    @y %= 480
  end

  #draw
  def draw
    @img.draw(@x, @y, 2)
  end

end

