=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#House
class House

  def initialize window, x, y
    @window = window
    @x, @y = x, y
    png = ["1.png", "2.png", "3.png", "4.png"].sample
    @img = Gosu::Image.new(window, "images/houses/house_" + png, false)
  end

  #draw
  def draw
    @img.draw(@x, @y, 2)
  end

  #move
  def move
    @y += 3.0
    @y = 0 if @y >= 480
  end

end

