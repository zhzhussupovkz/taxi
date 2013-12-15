=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#House
class House

  def initialize window, x, y, img
    @window = window
    @x, @y = x, y
    @img = Gosu::Image.new(window, img, false)
  end

  #draw
  def draw
    @img.draw(@x, @y, 2)
  end

end

