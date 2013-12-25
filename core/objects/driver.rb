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
      model = ["car_1", "car_2"].sample
      super window, x, y, "images/cars/" + model + ".png"
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  #move down
  def move_down
    @y += 2.5 if not injury
    @y += 1.75 if window.button_down? Gosu::KbUp
    if @y >= 480
      change
      @y = 0 
    end
  end

  #change
  def change
    @injury = false
    model = ["car_1", "car_2"].sample
    @img = Gosu::Image.new(window, "images/cars/" + model + ".png", false)
    coord = rand(135..185)
    @x = coord
  end

  #add injury
  def add_injury
    @injury = true
  end

end

