=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#World
class World

  def initialize window
    begin
      @window = window
      @bg = Gosu::Image.new(window, 'images/env/green.png', true)
      @road = Road.new(window, 120, 0)
      @board = Board.new(window)
      @taxi = Taxi.new(window, 250, 425)
      @pass = Passenger.new(self, 347.5, 0)
      @prize = Prize.new(window)
      @trees, @houses, @drivers = [], [], []
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :window, :trees, :taxi, :pass

  #start
  def start
    gen_houses
    gen_trees
    gen_drivers
  end

  #generate houses
  def gen_houses
    (20..500).step(100) do |i|
      @houses << House.new(window, 25, i)
      @houses << House.new(window, 370, i)
    end
  end

  #generate trees
  def gen_trees
    (10..500).step(100) do |i| @trees << Tree.new(window, 80, i) end
    (10..500).step(100) do |i| @trees << Tree.new(window, 325, i) end
  end

  #generate drivers
  def gen_drivers
    (10..600).step(150) do |i|
      coord = rand(135..185)
      model = ["car_1", "car_2"].sample
      @drivers << Driver.new(window, coord, i, "images/cars/" + model + ".png")
    end
  end

  #draw
  def draw
    begin
      @bg.draw(0, 0, 0)
      @road.draw
      @trees.each do |e| e.draw end
      @houses.each do |e| e.draw end
      @drivers.each do |e| e.draw end
      @taxi.draw
      @board.draw
      @pass.draw
      @prize.draw
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  #update
  def update
    begin
      @drivers.each do |e| e.move_down end
      @houses.each do |e| e.move end if window.button_down? Gosu::KbUp
      @trees.each do |e| e.move end if window.button_down? Gosu::KbUp
      if window.button_down? Gosu::KbUp
        @pass.move
        @prize.move
      end
      @taxi.driving
      update_passenger
      update_prize
      collect_prizes
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  #update passenger
  def update_passenger
    if not @taxi.pass
      curr = @taxi.last_trip
      time = rand(curr + 5..curr + 60)
      if (time == Time.now.to_i)
        @pass.y = 225
        @pass.drawing = true
      end
      if (window.button_down? Gosu::KbRightAlt) || (window.button_down? Gosu::KbLeftAlt)
        @pass.drawing = false
        @taxi.add_pass
      end
    end
  end

  #update prize
  def update_prize
    curr = @taxi.last_prize
    time = rand(curr + 10..curr + 30)
    if (time == Time.now.to_i)
      @prize.drawing = true
    end
  end

  #collect prizes
  def collect_prizes
    if (@prize.x - @taxi.x).abs <= 10.0 && (@prize.y - @taxi.y).abs <= 10.0 && (@prize.drawing == true)
      @prize.drawing = false
      @taxi.last_prize = Time.now.to_i
      case @prize.type
      when 'fuel'
        @taxi.refuel
      when 'money'
        @taxi.coin
      when 'damage'
        @taxi.repair
      end
    end
  end
  
end

