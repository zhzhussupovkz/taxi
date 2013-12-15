=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Taxi
class Taxi < Car

  def initialize window, x, y
    super window, x, y, "images/taxi.png"
    @fuel, @lives, @score = 0, 3, 0
    @ui = Gosu::Font.new(window, 'Monaco', 25)
    @beep = Gosu::Song.new(window, 'sounds/beep.ogg')
    @acc = Gosu::Song.new(window, 'sounds/cars.ogg')
  end

  #draw
  def draw
    super
    @ui.draw("Score: #{@score}", 485, 20, 2)
  end

  #accelerate
  def go
    super
    @acc.play(looping = true)
  end

  #beep
  def beep
    @beep.play(looping = false)
  end

end

