=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Prize
class Prize

  def initialize window
    @window = window
    @x, @y, @drawing = rand(225..280), rand(100..400), false
    @type = ['fuel', 'money', 'damage'].sample
    @img = Gosu::Image.new(window, "images/env/present.png", false)
  end

  attr_accessor :drawing
  attr_reader :type, :x, :y

  #draw
  def draw
    @img.draw(@x, @y, 2) if @drawing
  end

  #move
  def move
    @y += 3.0
    if @y >= 480
      @y = 0
      @window.world.taxi.last_prize = Time.now.to_i
      change
    end
  end

  #change
  def change
    @x, @y = rand(225..280), rand(100..400)
    @type = ['fuel', 'money', 'damage'].sample
    @drawing = false
  end

end

