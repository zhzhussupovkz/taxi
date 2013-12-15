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
    @bg = Gosu::Image.new(window, 'images/green.png', true)
    @road = Gosu::Image.new(window,'images/road.png', true)
    @sb = Gosu::Image.new(window, 'images/scboard.png', true)
    @ui = Gosu::Font.new(window, 'Monaco', 13)
    @taxi = Taxi.new(window, 250, 425)
    @trees, @houses = [], []
    @himg = [1, 2, 3, 4]
  end

  attr_reader :window, :trees

  #start
  def start
    (10..500).step(100) do |i| @trees << Tree.new(window, 75, i) end
    (10..500).step(100) do |i| @trees << Tree.new(window, 325, i) end
    (20..550).step(100) do |i|
      num = @himg.sample
      @houses << House.new(window, 25, i, "images/houses/house_" + num.to_s + ".png")
      num = @himg.sample
      @houses << House.new(window, 370, i, "images/houses/house_" + num.to_s + ".png")
    end
  end

  #draw
  def draw
    @bg.draw(0, 0, 0)
    @road.draw(120, 0, 1)
    @road.draw(120, 360, 1)
    @sb.draw(440, 0, 1)
    @trees.each do |e| e.draw end
    @houses.each do |e| e.draw end
    @taxi.draw
    @ui.draw("Copyright (c) 2013 by zhzhussupovkz", 445, 450, 2)
    @ui.draw("Icons by http://findicons.com", 460, 465, 2)
  end

  #update
  def update
    @taxi.move_left if window.button_down? Gosu::KbLeft
    @taxi.move_right if window.button_down? Gosu::KbRight
    @taxi.go if window.button_down? Gosu::KbUp
    @taxi.brake if window.button_down? Gosu::KbDown
    @taxi.beep if window.button_down? Gosu::KbSpace
    @taxi.move
  end
  
end

