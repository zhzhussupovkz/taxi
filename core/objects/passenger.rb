=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Passenger
class Passenger

  def initialize world, x, y
    @world, @x, @y = world, x, y
    png = ["boy.png", "girl.png"].sample
    @img = Gosu::Image.new(@world.window, "images/passengers/" + png, false)
    @distance = rand(10000..50000)
    @drawing = false
  end

  attr_accessor :drawing, :x, :y

  #draw
  def draw
    @img.draw(@x, @y, 2) if @drawing
  end

  #move
  def move
    @y += 3.0
    if @y >= 480
      @drawing = false
      change
      @world.taxi.last_trip = Time.now.to_i
    end
  end

  #change pass
  def change
    png = ["boy.png", "girl.png"].sample
    @img = Gosu::Image.new(@world.window, "images/passengers/" + png, false)
  end
  
end