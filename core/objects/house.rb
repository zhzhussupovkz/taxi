=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#House
class House

  def initialize window, x, y
    begin
      @window = window
      @x, @y = x, y
      png = ["1.png", "2.png", "3.png", "4.png"].sample
      @img = Gosu::Image.new(window, "images/houses/house_" + png, false)
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :window

  #draw
  def draw
    @img.draw(@x, @y, 2)
  end

  #move
  def move
    @y += 4.0 if window.world.taxi.gear == 1
    @y += 5.0 if window.world.taxi.gear == 2
    @y += 7.0 if window.world.taxi.gear == 3
    @y += 10.0 if window.world.taxi.gear == 4
    @y = 0 if @y >= 480
  end

end

