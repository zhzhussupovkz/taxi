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
    if @y >= 480
      change
      @y = 0 
    end
  end

  def change
    model = ["car_1", "car_2"].sample
    @img = Gosu::Image.new(window, "images/cars/" + model + ".png", false)
    coord = rand(135..185)
    @x = coord
  end

end

