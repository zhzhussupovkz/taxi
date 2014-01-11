=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
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
      @pass = Passenger.new(self, 347.5, 25)
      @prize = Prize.new(window)
      @trees, @houses, @drivers = [], [], []
      @ui = Gosu::Font.new(window, 'Monaco', 40)
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :window, :trees, :taxi, :pass, :prize

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
      @drivers << Driver.new(window, coord, i)
    end
  end

  #draw
  def draw
    begin
      @ui.draw("PAUSE", 225, 200, 4) if window.pause
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
      @road.update
      @drivers.each do |e| e.move_down end
      @houses.each do |e| e.move end if (window.button_down? Gosu::KbUp) && (not taxi.dead)
      @trees.each do |e| e.move end if (window.button_down? Gosu::KbUp) && (not taxi.dead)
      if (window.button_down? Gosu::KbUp) && (not taxi.dead)
        @pass.move
        @prize.move
      end
      @taxi.driving
      @pass.update
      @prize.update
      @drivers.each do |e|
        if (e.x - @taxi.x).abs <= 15.0 && (e.y - @taxi.y).abs <= 15.0
          @drivers.each do |d| d.add_injury end
          @taxi.add_injury
          @drivers.each do |d| d.repair end
        end
      end
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

end

