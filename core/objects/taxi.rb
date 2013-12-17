=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Taxi
class Taxi < Car

  def initialize window, x, y
    super window, x, y, "images/cars/taxi.png"
    @fuel, @damage, @money, @lives, @score = 100, 100, 200, 3, 0
    @ui = Gosu::Font.new(window, 'Monaco', 25)
    @beep = Gosu::Song.new(window, 'sounds/beep.ogg')
    @acc = Gosu::Song.new(window, 'sounds/cars.ogg')
  end

  #draw
  def draw
    super
    @ui.draw("Score: #{@score}", 485, 20, 2)
    @ui.draw("#{@money}", 525, 52, 2)
    @ui.draw("#{@damage}", 525, 77, 2)
    @ui.draw("#{@fuel}", 525, 102, 2)
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

  #driving
  def driving
    move_left if window.button_down? Gosu::KbLeft
    move_right if window.button_down? Gosu::KbRight
    go if window.button_down? Gosu::KbUp
    brake if window.button_down? Gosu::KbDown
    beep if window.button_down? Gosu::KbSpace
    move
  end

end

