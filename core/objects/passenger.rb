=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Passenger
class Passenger

  def initialize window, x, y
    @window, @x, @y = window, x, y
    png = ["boy.png", "girl.png"].sample
    @img = Gosu::Image.new(window, "images/passengers/" + png, false)
    @distance = rand(1000..5000)
  end

  #draw
  def draw
    @img.draw(@x, @y, 2)
  end
  
end