=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#World
class World

  def initialize window
    @window = window
    @bg = Gosu::Image.new(window, 'images/env/green.png', true)
    @road = Gosu::Image.new(window,'images/env/road.png', true)
    @board = Board.new(window)
    @taxi = Taxi.new(window, 250, 425)
    @trees, @houses, @drivers = [], [], []
    @himg = [1, 2, 3, 4]
  end

  attr_reader :window, :trees

  #start
  def start
    (10..500).step(100) do |i| @trees << Tree.new(window, 80, i) end
    (10..500).step(100) do |i| @trees << Tree.new(window, 325, i) end
    (20..500).step(100) do |i|
      num = @himg.sample
      @houses << House.new(window, 25, i, "images/houses/house_" + num.to_s + ".png")
      num = @himg.sample
      @houses << House.new(window, 370, i, "images/houses/house_" + num.to_s + ".png")
    end
    (10..600).step(150) do |i|
      coord = rand(135..185)
      model = ["car_1", "car_2"].sample
      @drivers << Driver.new(window, coord, i, "images/cars/" + model + ".png")
    end
  end

  #draw
  def draw
    @bg.draw(0, 0, 0)
    @road.draw(120, 0, 1)
    @road.draw(120, 360, 1)
    @trees.each do |e| e.draw end
    @houses.each do |e| e.draw end
    @drivers.each do |e| e.draw end
    @taxi.draw
    @board.draw
  end

  #update
  def update
    @drivers.each do |e| e.move_down end
    @houses.each do |e| e.move end if window.button_down? Gosu::KbUp
    @trees.each do |e| e.move end if window.button_down? Gosu::KbUp
    @taxi.driving
  end
  
end

