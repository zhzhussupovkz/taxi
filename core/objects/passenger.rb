=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Passenger
class Passenger

  def initialize world, x, y
    begin
      @world, @x, @y = world, x, y
      png = ["boy.png", "girl.png"].sample
      @img = Gosu::Image.new(@world.window, "images/passengers/" + png, false)
      @distance = rand(5000..10000)
      @drawing = false
      @ride = false
      @ui = Gosu::Font.new(world.window, 'Monaco', 25)
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_accessor :drawing, :x, :y, :ride
  attr_reader :distance, :world

  #draw
  def draw
    @img.draw(@x, @y, 2) if @drawing
    if world.taxi.pass
      @ui.draw("Distance: #{@distance}", 475, 50, 2)
    else
      @ui.draw("Distance: 0", 475, 50, 2) 
    end
  end

  #update
  def update
    if not world.taxi.pass
      curr = world.taxi.last_trip
      time = rand(curr + 5..curr + 60)
      if time == Time.now.to_i
        @drawing = true
      end
      if ((world.window.button_down? Gosu::KbRightAlt) || (world.window.button_down? Gosu::KbLeftAlt)) && (ride == false)
        @drawing = false
        world.taxi.add_pass
      end
    end
  end

  #move
  def move
    @y += 3.0 if @drawing
    if @y >= 480
      @drawing = false
      change
      @world.taxi.last_trip = Time.now.to_i
    end
  end

  #change pass
  def change
    @y = 25
    @ride = false
    if @world.taxi.pass == false
      png = ["boy.png", "girl.png"].sample
      @img = Gosu::Image.new(@world.window, "images/passengers/" + png, false)
    end
  end

  #cab ride
  def cab_ride
    @distance -= 1000
    @distance = 0 if @distance <= 0.0
  end

  #update distance
  def update_dist
    @distance = rand(5000..10000)
  end
  
end