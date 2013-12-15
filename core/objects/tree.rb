=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Tree
class Tree

  def initialize window, x, y
    @window = window
    @x, @y = x, y
    @img = Gosu::Image.new(window, "images/tree.png", false)
  end

  #draw
  def draw
    @img.draw(@x, @y, 2)
  end

end

