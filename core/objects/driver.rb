=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Driver
class Driver < Car

  def initialize window, x, y
    begin
      model = ["car_1", "car_2", "car_3", "car_4", "car_5"].sample
      super window, x, y, "images/cars/" + model + ".png"
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  #move down
  def move_down
    @y += 2.5 if not injury
    if (window.button_down? Gosu::KbUp) && (not window.world.taxi.dead)
      @y += 2.5 if window.world.taxi.gear == 1
      @y += 3.5 if window.world.taxi.gear == 2
      @y += 5.5 if window.world.taxi.gear == 3
      @y += 8.5 if window.world.taxi.gear == 4
    end
    if @y >= 480
      change
      @y = 0 
    end
  end

  #change
  def change
    @injury = false
    model = ["car_1", "car_2", "car_3", "car_4", "car_5"].sample
    @img = Gosu::Image.new(window, "images/cars/" + model + ".png", false)
    coord = rand(135..185)
    @x = coord
  end

  #add injury
  def add_injury
    @injury = true
  end

  #repair
  def repair
    @injury = false
  end

end

