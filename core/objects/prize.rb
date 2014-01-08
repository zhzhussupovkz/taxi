=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Prize
class Prize

  def initialize window
    begin
      @window = window
      @x, @y, @drawing = rand(225..280), rand(10..150), false
      @type = ['fuel', 'money', 'damage'].sample
      @img = Gosu::Image.new(window, "images/env/present.png", false)
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_accessor :drawing
  attr_reader :type, :x, :y, :window

  #draw
  def draw
    @img.draw(@x, @y, 2) if @drawing
  end

  #update
  def update
    curr = window.world.taxi.last_prize
    time = rand(curr + 10..curr + 30)
    if time == Time.now.to_i
      @drawing = true
    end
  end

  #move
  def move
    if @drawing
      @y += 4.0 if window.world.taxi.gear == 1
      @y += 5.0 if window.world.taxi.gear == 2
      @y += 7.0 if window.world.taxi.gear == 3
      @y += 10.0 if window.world.taxi.gear == 4
    end
    if @y >= 480
      @y = 0
      @window.world.taxi.last_prize = Time.now.to_i
      change
    end
  end

  #change
  def change
    @x, @y = rand(225..280), rand(10..150)
    @type = ['fuel', 'money', 'damage'].sample
    @drawing = false
  end

end

