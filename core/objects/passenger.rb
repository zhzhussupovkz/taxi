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
    @drawing = true
  end

  attr_accessor :drawing

  #draw
  def draw
    @img.draw(@x, @y, 2) if @drawing
  end

  #move
  def move
    @y += 3.0
    @y = 0 if @y >= 480
  end
  
end