=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Driver
class Driver < Car

  def initialize window, x, y, img
    super window, x, y, img
  end

  def move_down
    @y += 2.5
    @y = 0 if @y >= 480
  end

end

